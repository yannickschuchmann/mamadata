class Person < ActiveRecord::Base
  belongs_to :role
  has_many :benefit_incidents
  has_many :members
  has_many :programs, through: :members
end