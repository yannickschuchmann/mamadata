class CreateGodfatherPeople < ActiveRecord::Migration
  def change
    create_table :godfather_people do |t|
      t.integer :person_id
      t.integer :supporter_id
      t.boolean :is_current_godfather

      t.timestamps
    end
  end
end
