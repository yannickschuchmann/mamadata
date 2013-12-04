class Family < ActiveRecord::Base
	has_many :people
	belongs_to :communitydevelopment
end
