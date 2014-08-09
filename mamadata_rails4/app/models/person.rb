class Person < ActiveRecord::Base
  acts_as_xlsx

  has_attached_file :avatar, :styles => {:medium => "300x300>", :small => "160>", :thumb => "100x100>"}, :default_url => "/images/missing_:style.png"
  validates_attachment_content_type :avatar,
                                    :content_type => /^image\/(png|jpg|jpeg)/
  belongs_to :role
  belongs_to :family
  belongs_to :user, foreign_key: 'created_by'
  has_many :journals
  has_many :beneficiary_program_relationships
  has_many :programs, through: :beneficiary_program_relationships, before_remove: :archive_deleted_entries, after_add: :set_program_adder
  has_many :benefits, through: :programs
  has_many :schools
  has_many :school_classes, through: :schools
  has_many :godfather_people
  has_many :godfathers, :class_name => "Supporter", through: :godfather_people
  has_many :person_godfather_files, through: :godfather_people
  has_many :benefit_incidents
  monetize :income_paise, :disable_validation => true
  validates_presence_of :name, :fathers_name, :gender, :date_of_birth, :name_of_the_street, :zip_code, :narrative_text, :religion, :city, :place_of_birth, :marital_status
  validate :amount_to_big


  @program_ids_was = []

  def set_program_adder(obj)
    entries = BeneficiaryProgramRelationship.where(person_id: self.id, program_id: obj.id)
    entries.each do |entry|
      entry.adder = User.current
      entry.save
    end

  end

  def archive_deleted_entries(obj)
    histroy_entry = BeneficiaryProgramRelationship.where(person_id: self.id, program_id: obj.id)
    histroy_entry.each do |entry|
      entry.inspect
      entry.deleter=User.current
      entry.save
      entry.destroy
    end

  end

  def get_total_expenses (date = nil)
    total_expenses=Money.new(0)
    if date.nil?
      benefit_incidents = self.benefit_incidents
    else
      benefit_incidents = self.benefit_incidents.where('date_granted >= :date', :date => date)
    end
    benefit_incidents.each do |benefit|
      total_expenses+=benefit.amount
    end
    total_expenses
  end

  def self.with_total_expense
    Person.all.sort {|a,b| a.year_to_date <=> b.year_to_date}
  end

  def year_to_date
    self.get_total_expenses Date.today.beginning_of_financial_year
  end

  def month_to_date
    self.get_total_expenses Date.today.beginning_of_month
  end

  def current_godfather
    self.godfathers.first
  end

  def former_godfathers
    relations = GodfatherPerson.only_deleted.where(person_id: self.id).order("created_at ASC")
    former = []
    relations.each do |r|
      godfather = Supporter.where(id: r.godfather_id)
      former << godfather
    end
    former = former.collect { |el| el[0] }
    return former
  end

  def self.create_pdf ids
    ids = ids.split unless ids.is_a? Array
    paths = []
    headerHeight = 190
    ids.each do |id|
      @person = self.find(id)
      path = "/system/people/reports/pdf/#{id}_profile_#{Time.now.to_i.to_s}.pdf"
      Prawn::Document.generate("public#{path}") do |pdf|
        pdf.default_leading 10
        pdf.font_size 11
        pdf.repeat :all do
          # header
          pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
            pdf.image("#{Rails.root}/public/images/sharana_logo.png", :width => 80)
            pdf.move_down 10
            pdf.text "Created Date: #{DateTime.now.to_s}"
            pdf.text "Name: #{@person.name}"
            pdf.text "File Number: #{@person.id}", :leading => 0
            pdf.text "Old File Number: #{@person.file_number}"
            pdf.text "Fathers Name: #{@person.fathers_name}"
            pdf.text "Gender: #{@person.gender}", :leading => 0
            pdf.text "Date of Birth: #{@person.date_of_birth}", :leading => 0
            pdf.text "Place of Birth: #{@person.place_of_birth}"
          end
        end
        pdf.bounding_box([pdf.bounds.left, pdf.bounds.top - headerHeight], :width  => pdf.bounds.width, :height => pdf.bounds.height - headerHeight) do
          if @person.avatar_file_name == "missing_gif"

          end
          pdf.image("#{Rails.root}/public#{@person.avatar.url(:small).split("?")[0]}", :width => 160 , :position => :left)
          pdf.move_down 20
          pdf.text "ZIP Code: #{@person.zip_code}", :leading => 0
          pdf.text "City/Village: #{@person.city}", :leading => 0
          pdf.text "Area: #{@person.area}", :leading => 0
          pdf.text "Number of the House: #{@person.number_of_the_house}", :leading => 0
          pdf.text "Street Name: #{@person.name_of_the_street}"
          pdf.text "Religion: #{@person.religion}", :leading => 0
          pdf.text "Caste: #{@person.caste}"
          pdf.text "Completed Education: #{@person.education}", :leading => 0
          pdf.text "Marital Status: #{@person.marital_status}"
          pdf.text "Occupation: #{@person.occupation}", :leading => 0
          pdf.text "Income: #{@person.income_paise}"
          pdf.text "Health Condition: #{@person.health_condition}"
          pdf.text "Godfathers: ", :leading => 5
          pdf.indent 20 do
            @person.godfathers.each_with_index do |godfather, index|
              pdf.text "#{index+1}. #{godfather.name} #{godfather.family_name}"
            end
          end
          pdf.start_new_page
          pdf.text "Narrative Text: ", :leading => 5
          pdf.text "#{@person.narrative_text}", :leading => 0
          pdf.start_new_page

          # programs
          pdf.text "Programs: "
          programs = @person.programs.map do |program|
            [program.name, program.created_at.to_s, program.created_at.to_s]
          end
          programs.insert(0, ["Name", "From", "Till"])
          if programs.size > 1 then pdf.table(programs) else pdf.text "No programs" end

          pdf.move_down 20

          # benefits
          pdf.text "Benefits: "
          benefits = @person.benefits.map do |benefit|
            [benefit.name, benefit.get_amount_year_to_date.to_s]
          end
          benefits.insert(0, ["Name", "Amount"])
          if benefits.size > 1
            pdf.table(benefits)
            pdf.move_down 10

            pdf.text "Total: INR #{@person.year_to_date}"
          else
            pdf.text "No benefits"
          end

          pdf.move_down 20

          #schools
          schools = @person.schools
          current_school = schools.pop

          if current_school
            pdf.text "Current School:"
            pdf.indent 20 do
              pdf.text "Name: #{current_school.name}", :leading => 0
              pdf.text "Type: #{current_school.type}", :leading => 0
              pdf.text "Remark: #{current_school.remark}", :leading => 0
            end
            pdf.move_down 20
          end

          pdf.text "School History:"
          schools.each do |school|
            pdf.indent 20 do
              pdf.text "Name: #{school.name}", :leading => 0
              pdf.text "Type: #{school.type}", :leading => 0
              pdf.text "Remark: #{school.remark}", :leading => 0
              pdf.move_down 10
            end
          end

        end
      end
      paths << path
    end
    paths.size > 1 ? paths : paths[0]
  end


  def self.sort_attribute_names
    attribute_names = [["-", ""]]
    self.real_attribute_names.each do |n|
      stripped = n.gsub(' ', '_').downcase
      attribute_names << [n+" a-z", stripped+"#asc"]
      attribute_names << [n+" z-a", stripped+"#desc"]
    end
    attribute_names
  end

  def self.real_attribute_names
    ["Name", "Fathers Name", "Head of Household", "Gender", "Date of birth", "Place of birth", "City", "ZIP Code", "Role", "Total Expense"]
  end

  def set_old_program_ids
    @program_ids_was = self.program_ids
  end



  protected

  def amount_to_big
    if self.income_paise > 8999999999999999900 && !self.income_paise.nil?
      errors.add(:base, "Amount for income is too big")
    end
  end

  def validate_head_of_household
    # maybe.later.you know?
    #errors.add(:base, "Person is currently in a family. Please change it there") unless self.role_id == 1
  end


end
