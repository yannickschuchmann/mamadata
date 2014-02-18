class GodfatherPerson < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :person
	belongs_to :godfather, class_name: "Supporter"
end
