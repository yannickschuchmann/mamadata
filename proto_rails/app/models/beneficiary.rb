class Beneficiary < ActiveRecord::Base
	has_many :ben_family_members
end
