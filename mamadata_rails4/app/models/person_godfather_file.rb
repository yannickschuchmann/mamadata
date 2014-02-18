class PersonGodfatherFile < ActiveRecord::Base
	belongs_to :godfather_person
	has_attached_file :file
	
end
