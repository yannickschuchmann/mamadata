class Person < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "160>", :thumb => "100x100>" }, :default_url => "/images/missing_:style.gif"
  belongs_to :role
  belongs_to :family
  has_many :journals
  has_many :beneficiary_program_relationships
  has_many :programs, through: :beneficiary_program_relationships, dependent: :destroy
  has_many :benefits, through: :programs
  has_many :schools
  has_many :godfather_people
  has_many :godfathers, :class_name => "Supporter", through: :godfather_people, dependent: :destroy
  has_many :person_godfather_files, through: :godfather_people
  has_many :benefit_incidents
  monetize :income_paise, :disable_validation => true,:with_currency => :inr, :numericality => {
    greater_than_or_equal_to: 0 }
  validate :amount_to_big

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
      return total_expenses
    end

    def year_to_date
      self.get_total_expenses Date.today.beginning_of_financial_year
    end

    def month_to_date
      self.get_total_expenses Date.today.beginning_of_month
    end

    def current_godfather
      return self.godfathers.first
    end

    def former_godfathers
      relations = GodfatherPerson.only_deleted.where(person_id: self.id).order("created_at ASC")
      former = []
      relations.each do |r|
        godfather = Supporter.where(id: r.godfather_id)
        former << godfather
      end
      former = former.collect{|el| el[0]}
      return former
   end


  protected

  def amount_to_big
    if self.income_paise > 8999999999999999900 && !self.income_paise.nil?
      errors.add(:base, "Amount for income is too big")
    end
  end


end