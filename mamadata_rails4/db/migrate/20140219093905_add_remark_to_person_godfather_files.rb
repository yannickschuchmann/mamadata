class AddRemarkToPersonGodfatherFiles < ActiveRecord::Migration
  def change
    add_column :person_godfather_files, :remark, :string, null: false, default: ""
  end
end
