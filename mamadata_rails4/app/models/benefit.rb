class Benefit < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :programs, through: :program_benefit_relationships 
	has_many :benefit_incidents
	validates :name, presence: true
	monetize :optional_amount_paise, allow_nil: true,  :numericality => {
    :greater_than_or_equal_to => 0 }
  after_save :update_calculated_amount

protected
		def update_calculated_amount
			if self.optional_amount
				total_numer_of_benefits = BenefitIncident.count(conditions: ["benefit_id = ?", self.id])
				amount=self.optional_amount_paise/total_numer_of_benefits unless total_numer_of_benefits <=0
				BenefitIncident.update_all(["amount_paise = ? ", amount], ["benefit_id = ?", self.id])
			end
		end

end