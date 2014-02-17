class BenefitIncident < ActiveRecord::Base
	register_currency :eur
	register_currency :usd
	register_currency :inr
	belongs_to :person
	belongs_to :program
	belongs_to :benefit
	validates :person_id, presence: true
	validates :program_id, presence: true
	validates :benefit_id, presence: true
	validate :check_max_users_reached
	monetize :amount_paise, :with_currency => :inr, :numericality => {
    :greater_than_or_equal_to => 0 }
  monetize :amount_in_euro_paise, :with_currency => :eur
  monetize :amount_in_dollar_paise, :with_currency => :usd
	before_save :set_default_status
	before_save :set_date_granted
	before_save :update_calculated_amount
	before_save :set_fixed_amount
	before_save :set_current_exchange_rates




	protected

		def set_current_exchange_rates
			self.amount_in_euro=self.amount.exchange_to(:EUR)
		end

		def update_calculated_amount
			if self.benefit.optional_amount
				self.amount=self.benefit.optional_amount/self.benefit.max_people unless benefit.max_people <= 0
			end
		end

		def check_max_users_reached
			if self.benefit.optional_amount
				num_of_incidents_with_benefit = BenefitIncident.where(benefit_id: self.benefit_id).count
				errors.add(:benefit_incident, "max number of users reached") unless num_of_incidents_with_benefit < self.benefit.max_people	
			end
		end

		def set_fixed_amount
			if self.benefit.fixed_amount
				self.amount = self.benefit.fixed_amount
			end
		end
		
		
		def set_default_status
			self.status = false unless self.status
			self.date_granted = nil unless self.date_granted
		end

		def set_date_granted
			if self.status == true 
				self.date_granted = DateTime.now.to_s(:long)
			elsif self.status == false
				self.date_granted = nil
			end
		end


end