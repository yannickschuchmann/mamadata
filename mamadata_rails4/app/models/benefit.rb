class Benefit < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :programs, through: :program_benefit_relationships 
	has_many :benefit_incidents
	validates :name, presence: true
end
