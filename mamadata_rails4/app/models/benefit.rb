class Benefit < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :programs, through: :program_benefit_relationships 
	has_many :benefit_incidents
	has_many :people, through: :programs
	validates :name, presence: true
	validates :max_people, allow_nil: true, :numericality => {greater_than_or_equal_to: 1}
	validate :validate_calculated_amount

	monetize :optional_amount_paise, allow_nil: true,  :numericality => {
    greater_than_or_equal_to: 0 }
  monetize :fixed_amount_paise, allow_nil: true,  :numericality => {
    greater_than_or_equal_to: 0 }


  after_save :update_calculated_amount_for_incidents

protected
	def validate_calculated_amount
		if self.optional_amount && (!self.max_people || self.max_people <1)
			errors.add(:benefit, "has to specify max users for calculated amount")
		end
	end




		def update_calculated_amount_for_incidents
			if self.optional_amount && self.max_people 
				amount_per_incident=Money.new(0)
				amount_per_incident=self.optional_amount/self.max_people
				BenefitIncident.where(benefit_id: self.id).each do |incident|
					incident.update_attribute(:amount, amount_per_incident)
				end
			end
		end

end