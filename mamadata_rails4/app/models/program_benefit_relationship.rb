class ProgramBenefitRelationship < ActiveRecord::Base
	belongs_to :program
	belongs_to :benefit
	has_many :benefit_incidents
end