class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships
	has_many :members
	has_many :beneficiaries, through: :members, source: 'person'
	accepts_nested_attributes_for :benefits

def benefit_attributes=(attributes)
	attributes.each do |a|
		self.benefits << Benefit.find_by(id: a["id"])
	end
end

end
