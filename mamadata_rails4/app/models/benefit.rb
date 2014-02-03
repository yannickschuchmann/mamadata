class Benefit < ActiveRecord::Base
	has_many :program_benefit_relationships
	has_many :programs, through: :program_benefit_relationships 
	has_many :benefit_incidents
	validates :name, presence: true
	monetize :optional_amount_paisas, allow_nil: true,  :numericality => {
    :greater_than_or_equal_to => 0 }
end