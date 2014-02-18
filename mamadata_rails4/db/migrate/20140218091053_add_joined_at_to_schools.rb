class AddJoinedAtToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :joined_at, :date
  end
end
