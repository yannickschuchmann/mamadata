class Person < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :small => "160>", :thumb => "100x100>" }, :default_url => "/images/missing_:style.gif"
  belongs_to :role
  belongs_to :family
  has_many :beneficiary_program_relationships
  has_many :programs, through: :beneficiary_program_relationships
  has_many :benefits, through: :programs
  belongs_to :godfather, :class_name => "Supporter"
  has_many :benefit_incidents
  monetize :income_paise, :numericality => {
    greater_than_or_equal_to: 0 }
  

    def get_total_expenses
      total_expenses=Money.new(0)
      self.benefit_incidents.each do |benefit|
          total_expenses+=benefit.amount
      end
      return total_expenses
    end


end