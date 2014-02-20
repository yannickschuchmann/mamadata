class Benefit < ActiveRecord::Base
	register_currency :inr
	has_many :program_benefit_relationships
	has_many :programs, through: :program_benefit_relationships 
	has_many :benefit_incidents
	has_many :people, through: :programs
	validates :name, presence: true
	validates :max_people, allow_nil: true, :numericality => {greater_than_or_equal_to: 1}
	validate :calculated_amount_is_not_nil # if category is set to calculated
	validate :fixed_amount_is_not_nil

	validate :validate_calculated_amount
	validate :optional_amount_xor_fixed_amount

	monetize :optional_amount_paise, :with_currency => :inr, allow_nil: true,  :numericality => {
    greater_than_or_equal_to: 0 }
  monetize :fixed_amount_paise, :with_currency => :inr, allow_nil: true,  :numericality => {
    greater_than_or_equal_to: 0 }


  after_save :update_calculated_amount_for_incidents

  def get_total_amount(status=true)
  	total_amount=Money.new(0)
    self.benefit_incidents.each do |benefit|
      if(benefit.status == status)
        total_amount+=benefit.amount
      end
    end
    return total_amount
  end






protected
	def optional_amount_xor_fixed_amount
		if !(self.optional_amount.blank? || self.fixed_amount.blank?)
      errors.add(:base, "Specify a calculated amount or a fixed amount , not both") unless (optional_amount.blank? ^ fixed_amount.blank?)
		end
	end


	def validate_calculated_amount
		if !self.optional_amount.blank? && (self.max_people.blank? || self.max_people <1)
			errors.add(:benefit, "has to specify max users for calculated amount")
		end
	end

	def calculated_amount_is_not_nil
		if self.category == "calculated"
			errors.add(:base, "Specify the Calculated Amount for this Benefit") if self.optional_amount.blank?
		end
	end

	def fixed_amount_is_not_nil
		if self.category == "fixed"
			errors.add(:base, "Specify the Fixed Amount for this Benefit") if (self.fixed_amount.blank? || self.fixed_amount < 1)
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