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
	has_many :guardians, dependent: :destroy
	after_create :create_guardians
	accepts_nested_attributes_for :guardians

	@@number_guardians = 2

	def create_guardians
		@@number_guardians.times { self.guardians.create }
	end
end
