class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships
	has_many :benefit_incidents
	has_many :beneficiary_program_relationships
	has_many :people, through: :beneficiary_program_relationships
	has_many  :active_people, -> { where is_active: true }, class_name: 'BeneficiaryProgramRelationship'
	validates :name, presence: true
end