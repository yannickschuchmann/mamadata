class Beneficiary < ActiveRecord::Base
  has_many :members
  has_many :programs, through: :members
  belongs_to :godfather, :class_name => "Supporter"
  has_many :benefit_incidents
end