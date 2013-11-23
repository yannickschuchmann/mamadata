class Person < ActiveRecord::Base
  belongs_to :role
  has_many :benfit_incidents
end
