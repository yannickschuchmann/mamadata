class Benefit < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :programs, through: :program_benefit_relationships 
	accepts_nested_attributes_for :program_benefit_relationships
end
