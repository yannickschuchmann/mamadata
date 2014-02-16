class Person < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "160>", :thumb => "100x100>" }, :default_url => "/images/missing_:style.gif"
  belongs_to :role
  belongs_to :family
  has_many :journals
  has_many :beneficiary_program_relationships
  has_many :programs, through: :beneficiary_program_relationships
  has_many :benefits, through: :programs
  belongs_to :godfather, :class_name => "Supporter"
  has_many :benefit_incidents
  monetize :income_paise, :numericality => {
    greater_than_or_equal_to: 0 }
  

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

end