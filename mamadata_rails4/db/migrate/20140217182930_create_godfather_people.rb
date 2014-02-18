class CreateGodfatherPeople < ActiveRecord::Migration
  def change
    create_table :godfather_people do |t|
      t.integer :person_id
      t.integer :godfather_id

      t.timestamps
    end
  end
end
