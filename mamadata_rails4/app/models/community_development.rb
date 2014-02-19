class CommunityDevelopment < ActiveRecord::Base
	serialize :family_skilled_in_art
	serialize :illness_treatment
	has_many :families
end
