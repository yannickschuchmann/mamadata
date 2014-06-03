class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, :default => ""
      t.string :fathers_name, :default => ""
      t.string :gender, :default => ""
      t.date :date_of_birth
      t.string :place_of_birth, :default => ""
      t.string :native_place, :default => ""
      t.string :name_of_the_house, :default => ""
      t.integer :number_of_the_house
      t.string :name_of_the_street, :default => ""
      t.string :city, :default => ""
      t.integer :pin_code
      t.string :religion, :default => ""
      t.string :caste, :default => ""
      t.string :education, :default => ""
      t.string :marital_status, :default => ""
      t.string :health_condition, :default => ""
      t.string :occupation, :default => ""
      t.integer :income_paise
      t.money :income
      t.references :family, index:true
      t.references :role, index: true
      t.string :school_name, :default => ""
      t.string :school_type, :default => ""
      t.string :school_language, :default => ""
      t.string :school_class, :default => ""
      t.text :narrative_text, :default
      t.string :status, :default => ""
      t.references :godfather, index: true
      t.timestamps
    end
  end
end