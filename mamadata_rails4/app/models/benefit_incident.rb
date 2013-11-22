class BenefitIncident < ActiveRecord::Base
	belongs_to :person
	has_one :program_benefit_relationship
end
