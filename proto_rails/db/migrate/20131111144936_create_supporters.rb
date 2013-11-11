class CreateSupporters < ActiveRecord::Migration
  def change
    create_table :supporters do |t|
      t.string :organisation
      t.string :name
      t.string :family_name
      t.date :date_of_birth
      t.string :country
      t.string :city
      t.string :street
      t.integer :zipcode
      t.string :email
      t.string :website
      t.string :telephone_number
      t.string :godfather
      t.boolean :is_volunteer
      t.date :begin_of_work
      t.date :end_of_work
      t.string :type_of_work

      t.timestamps
    end
  end
end
