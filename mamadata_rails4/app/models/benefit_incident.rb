class BenefitIncident < ActiveRecord::Base
	belongs_to :person
	belongs_to :program
	belongs_to :benefit
	validates :person_id, presence: true
	validates :program_id, presence: true
	validates :benefit_id, presence: true
	monetize :amount_paisas, allow_nil: true,  :numericality => {
    :greater_than_or_equal_to => 0 }
	before_save :set_default_status
	before_save :set_date_granted








	protected
		
		def set_default_status
			self.status = false unless self.status
			self.date_granted = nil unless self.date_granted
		end

		def set_date_granted
			self.date_granted = DateTime.now.to_s(:long) if self.status == true
		end


end