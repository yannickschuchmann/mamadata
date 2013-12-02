class ProgramBenefitRelationship < ActiveRecord::Base
	belongs_to :program
	belongs_to :benefit
	has_many :benefit_incidents
	# validates :program_id, presence: true
	# validates :benefit_id, presence: true
end