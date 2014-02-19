class ChangeDatetoDateTimeSchools < ActiveRecord::Migration
  def change
    change_column :schools, :joined_at, :datetime
  end
end
