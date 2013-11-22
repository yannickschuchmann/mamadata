class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships


	def add_benefit(benefit)
		program_benefit_relationships.create!(benefit_id: benefit.id)
	end

	def remove_benefit(benefit)
		program_benefit_relationships.find_by(benefit_id: benefit.id).destroy!
	end

end
