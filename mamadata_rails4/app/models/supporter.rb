class Supporter < ActiveRecord::Base
	has_many :godfather_people
	has_many :people, through: :godfather_people
	validates :name, presence: true
	validates :email, presence: true
	validates :city, presence: true
	validates :country, presence: true
	validates :zipcode, presence: true
end
