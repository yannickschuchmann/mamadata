class Supporter < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true
	validates :city, presence: true
	validates :country, presence: true
	validates :zipcode, presence: true
end
