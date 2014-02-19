class AddHeadOfHouseHoldToPerson < ActiveRecord::Migration
  def change
    add_column :people, :head_of_household, :string
  end
end
