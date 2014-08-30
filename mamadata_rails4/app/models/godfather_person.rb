class GodfatherPerson < ActiveRecord::Base
	acts_as_paranoid
	belongs_to :person, touch: true
	belongs_to :godfather, class_name: "Supporter", touch: true
	has_many :person_godfather_files
	accepts_nested_attributes_for :person_godfather_files
end
