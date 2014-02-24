class BenefitIncident < ActiveRecord::Base
	scope :last_date_granted, -> { order(date_granted: :desc) }
	belongs_to :person
	belongs_to :program
	belongs_to :benefit
	belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
	belongs_to :granter, class_name: 'User', foreign_key: 'granted_by'
	validates :person_id, presence: true
	validates :program_id, presence: true
	validates :benefit_id, presence: true
	validate :check_max_users_reached
	monetize :amount_paise, :disable_validation => true
  monetize :amount_in_euro_paise, :with_currency => :eur
  monetize :amount_in_dollar_paise, :with_currency => :usd
	before_save :set_default_status
	before_save :set_date_granted
	before_save :update_calculated_amount
	before_save :set_fixed_amount
	validate :amount_to_big
	before_save :check_and_set_granter, only: [:update]
	# before_save :set_current_exchange_rates


	def check_and_set_granter
		self.granter = User.current if self.changed_attributes['status'] == false and self.status == true
	end

	protected
	 def amount_to_big
    if self.amount_paise > 8999999999999999900 && !self.amount_paise.nil?
      errors.add(:base, "The Amount you entered is too high")
    end
  end

		def set_current_exchange_rates
			if self.changed_attributes.include?("amount_paise")
				self.amount_in_euro=self.amount.exchange_to(:EUR)
				self.amount_in_dollar=self.amount.exchange_to(:USD)
			end
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
			if self.status == true && (self.date_granted == nil)
				self.date_granted = DateTime.now
			elsif self.status == false
				self.date_granted = nil
			end
		end


end