class Benefit < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :programs, through: :program_benefit_relationships 


	def add_program(program)
		program_benefit_relationships.create!(program_id: program.id)
	end

	def remove_program(program)
		program_benefit_relationships.find_by(program_id: program.id).destroy!
	end
end
