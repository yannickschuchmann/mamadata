class Member < ActiveRecord::Base
	belongs_to :program
	belongs_to :person
	validates :program_id, presence: true
	validates :person_id, presence: true
end
