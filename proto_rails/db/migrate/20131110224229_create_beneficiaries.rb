class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.string :name
      t.string :fathers_name
      t.string :gender
      t.date :date_of_birth
      t.string :place_of_birth
      t.string :native_place
      t.string :house_name
      t.integer :house_number
      t.string :street_name
      t.string :city
      t.integer :pin_code

      t.timestamps
    end
  end
end
