class RemovePersonIdFromCommunityDevelopment < ActiveRecord::Migration
  def change
    remove_column :community_developments, :person_id
  end
end
