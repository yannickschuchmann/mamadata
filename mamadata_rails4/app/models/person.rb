class Person < ActiveRecord::Base
  belongs_to :role
  has_many :benefit_incidents
end