class AddDeletedAtToGodfatherPeople < ActiveRecord::Migration
  def change
    add_column :godfather_people, :deleted_at, :datetime
  end
end
