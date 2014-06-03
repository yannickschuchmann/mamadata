class RemoveHeadOfHouseholdFromCommunityDevelopment < ActiveRecord::Migration
  def change
    remove_column :community_developments, :head_of_household_id
  end
end
