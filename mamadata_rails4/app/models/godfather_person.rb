class GodfatherPerson < ActiveRecord::Base
	belongs_to :person
	belongs_to :godfather, class_name: "Supporter"
end
