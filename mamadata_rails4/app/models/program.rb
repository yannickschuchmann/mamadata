class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships
	has_many :benefit_incidents
	has_many :beneficiary_program_relationships
	has_many :people, through: :beneficiary_program_relationships
	validates :name, presence: true
end