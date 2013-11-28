class Beneficiary < ActiveRecord::Base
  has_many :members
  has_many :programs, through: :members
  belongs_to :godfather
  accepts_nested_attributes_for :programs

def program_attributes=(attributes)
	attributes.each do |a|
		self.programs << Program.find_by(id: a["id"])
	end
end




end
