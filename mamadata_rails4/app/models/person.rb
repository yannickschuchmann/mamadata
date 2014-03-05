class Person < ActiveRecord::Base
  acts_as_xlsx
  has_attached_file :avatar, :styles => {:medium => "300x300>", :small => "160>", :thumb => "100x100>"}, :default_url => "/images/missing_:style.gif"
  belongs_to :role
  belongs_to :family
  belongs_to :user, foreign_key: 'created_by'
  has_many :journals
  has_many :beneficiary_program_relationships
  has_many :programs, through: :beneficiary_program_relationships#, dependent: :destroy
  has_many :benefits, through: :programs
  has_many :schools
  has_many :godfather_people
  has_many :godfathers, :class_name => "Supporter", through: :godfather_people#, dependent: :destroy
  has_many :person_godfather_files, through: :godfather_people
  has_many :benefit_incidents
  monetize :income_paise, :disable_validation => true
  validates_presence_of :name, :fathers_name, :gender, :date_of_birth, :name_of_the_street, :zip_code, :narrative_text, :religion, :city, :place_of_birth, :marital_status
  validate :amount_to_big

  #validate :validate_head_of_household

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
    ids.each do |id|
      @person = self.find(id)
      path = "/system/people/reports/pdf/#{id}_#{Time.now.to_i.to_s}.pdf"
      Prawn::Document.generate("public#{path}") do |pdf|
        pdf.font_size(25) { pdf.text "Beneficiary Report" }
        #pdf.image @person.avatar.url(:medium), :position => :left
        content = @person.attribute_names.map do |attribute|
          [attribute, @person[attribute].to_s]
        end
        pdf.table(content)
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
