class Program < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :benefits, through: :program_benefit_relationships
	has_many :benefit_incidents
	has_many :members
	has_many :beneficiaries, through: :members, source: 'beneficiary'
	validates :name, presence: true

end
