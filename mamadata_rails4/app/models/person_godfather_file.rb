class PersonGodfatherFile < ActiveRecord::Base
	belongs_to :godfather_person
	has_one :person, through: :godfather_person
	has_attached_file :file
	validates :file, presence: true
	
end
