class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :fathers_name
      t.string :gender
      t.date :date_of_birth
      t.string :place_of_birth
      t.string :native_place
      t.string :name_of_the_house
      t.integer :number_of_the_house
      t.string :name_of_the_street
      t.string :city
      t.integer :pin_code
      t.string :religion
      t.string :caste
      t.string :education
      t.string :marital_status
      t.string :health_condition
      t.string :occupation
      t.integer :income
      t.references :role, index: true
      t.integer :father_id
      t.integer :mother_id
      t.timestamps
    end
  end
end
