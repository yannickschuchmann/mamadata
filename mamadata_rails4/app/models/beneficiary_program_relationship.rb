class BeneficiaryProgramRelationship < ActiveRecord::Base
	belongs_to :program
	belongs_to :person
end
