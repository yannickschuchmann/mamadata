class Supporter < ActiveRecord::Base
	has_many :godfather_people, :foreign_key => 'godfather_id'
	has_many :people, through: :godfather_people
	belongs_to :donor_type
	validates :name, presence: true
	validates :email, presence: true
	validates :city, presence: true
	validates :country, presence: true
	validates :zipcode, presence: true
	monetize :donation_amount_paise, :disable_validation => true, :with_currency => :inr, :numericality => {
    :greater_than_or_equal_to => 0 }




end # end Supporter




# class Volunteer < Supporter
#  	def self.model_name
#    	Supporter.model_name
#  	end
# end

# class Donor < Supporter
# 	def self.model_name
# 		Supporter.model_name
# 	end
# end
