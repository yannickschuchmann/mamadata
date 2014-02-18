class RenamePinToZipColumnOfPeople < ActiveRecord::Migration
  def change
    rename_column :people, :pin_code, :zip_code
  end
end
