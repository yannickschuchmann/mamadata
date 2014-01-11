class BenefitIncident < ActiveRecord::Base
	belongs_to :person
	belongs_to :program
	belongs_to :benefit
	validates :person_id, presence: true
	validates :program_id, presence: true
	validates :benefit_id, presence: true
	before_save :set_default_status

	protected
		
		def set_default_status
			self.status = false unless self.status
			self.date_granted = nil unless self.date_granted
		end


end