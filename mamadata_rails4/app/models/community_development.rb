class CommunityDevelopment < ActiveRecord::Base
	serialize :family_skilled_in_art
	serialize :illness_treatment
	serialize :facilities
	serialize :mode_of_savings
	serialize :origin_loan
	serialize :reasons_loan
	serialize :alcoholism_problems
	serialize :children_immunised
	has_one :family
end
