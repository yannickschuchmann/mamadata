class ProgramBenefitRelationship < ActiveRecord::Base
	belongs_to: :program
	belongs_to: :benefit
end
