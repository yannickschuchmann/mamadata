class Supporter < ActiveRecord::Base
	has_many :godfather_persons
	has_many :people, through: :godfather_persons
	validates :name, presence: true
	validates :email, presence: true
	validates :city, presence: true
	validates :country, presence: true
	validates :zipcode, presence: true
end
