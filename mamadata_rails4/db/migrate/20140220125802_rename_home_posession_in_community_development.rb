class RenameHomePosessionInCommunityDevelopment < ActiveRecord::Migration
  def change
    rename_column :community_developments, :house_posession, :house_possession
  end
end
