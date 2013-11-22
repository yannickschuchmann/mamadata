class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships 
end
