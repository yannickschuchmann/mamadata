class Person < ActiveRecord::Base
  belongs_to :role
  belongs_to :family
end