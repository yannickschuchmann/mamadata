class BenefitIncident < ActiveRecord::Base
	belongs_to :person
	belongs_to :program
	belongs_to :benefit
	belongs_to :program_benfit_relationship


end
