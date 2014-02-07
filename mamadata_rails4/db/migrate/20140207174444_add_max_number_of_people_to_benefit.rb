class AddMaxNumberOfPeopleToBenefit < ActiveRecord::Migration
  def change
    add_column :benefits, :max_people, :integer
  end
end
