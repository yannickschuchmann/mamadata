class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships
	has_many :members
	has_many :beneficiaries, through: :members
	accepts_nested_attributes_for :benefits
end
