class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships
	has_many :beneficiaries
	accepts_nested_attributes_for :benefits
	has_many :members
	has_many :persons, through: :members
end
