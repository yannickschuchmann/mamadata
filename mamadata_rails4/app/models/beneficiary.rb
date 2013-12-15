class Beneficiary < ActiveRecord::Base
  has_many :beneficiaries_programs
  has_many :programs, through: :beneficiaries_programs
  belongs_to :godfather, :class_name => "Supporter"
  has_many :benefit_incidents
end