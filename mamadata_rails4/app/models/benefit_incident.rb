class BenefitIncident < ActiveRecord::Base
	belongs_to :person
	belongs_to :program
	belongs_to :benefit
	belongs_to :beneficiary
	validates :person_id, presence: true
	validates :program_id, presence: true
	validates :benefit_id, presence: true
end