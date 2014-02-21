class Benefit < ActiveRecord::Base
	register_currency :inr
	has_many :program_benefit_relationships
	has_many :programs, through: :program_benefit_relationships 
	has_many :benefit_incidents
	has_many :people, through: :programs
	validates :name, presence: true, length: { maximum: 250 }
	validates :description, length: { maximum: 250 }
	validates :max_people, allow_nil: true, :numericality => {greater_than_or_equal_to: 1}
	validate :calculated_amount_is_not_nil # if category is set to calculated
	validate :fixed_amount_is_not_nil
	validate :amount_to_big
	validate :validate_calculated_amount
	validate :optional_amount_xor_fixed_amount

	monetize :optional_amount_paise, :disable_validation => true, allow_nil: true
  monetize :fixed_amount_paise, :disable_validation => true, allow_nil: true


  after_save :update_calculated_amount_for_incidents

	def get_total_amount(status=true, date=nil)
		total_amount=Money.new(0)
		if date.nil?
      benefit_incidents = self.benefit_incidents
    else
    	benefit_incidents = status==true ? self.benefit_incidents.where('date_granted >= :date', :date => date) : self.benefit_incidents.where('created_at >= :date', :date => date)
    end
    benefit_incidents.each do |benefit|
      if(benefit.status == status)
        total_amount+=benefit.amount
      end
    end
    return total_amount
  end

  def get_amount_year_to_date(status=true)
	  self.get_total_amount(status, Date.today.beginning_of_financial_year)
  end

  def get_category
  	if self.category == "none"
  		return "Set Individual Amount"
  	elsif self.category == "calculated"
  		return "Calculated Amount"
  	elsif self.category == "fixed"
  		return "Fixed Amount"
  	elsif self.category.nil?
  		return "No Status Set"
  	end
  end






protected

  def amount_to_big
    if self.optional_amount_paise > 8999999999999999900 || self.fixed_amount > 8999999999999999900
      errors.add(:base, "The Amount you entered is too high")
    end unless self.category == "none" || self.optional_amount_paise.nil? || self.fixed_amount.nil? end



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