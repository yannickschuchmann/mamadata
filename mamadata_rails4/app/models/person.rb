class Person < ActiveRecord::Base
  belongs_to :role
  belongs_to :family
  has_many :beneficiary_program_relationships
  has_many :programs, through: :beneficiary_program_relationships
  belongs_to :godfather, :class_name => "Supporter"
  has_many :benefit_incidents
end