class Beneficiary < ActiveRecord::Base
  belongs_to :program
  belongs_to :godfather
end
