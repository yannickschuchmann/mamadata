class CreatePersonGodfatherFiles < ActiveRecord::Migration
  def change
    create_table :person_godfather_files do |t|
      t.integer :godfather_person_id
      t.attachment :file

      t.timestamps
    end
  end
end
