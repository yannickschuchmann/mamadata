class CreateBenFamilyMembers < ActiveRecord::Migration
  def change
    create_table :ben_family_members do |t|
      t.references :beneficiary
      t.string :relation
      t.string :status
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.string :profession
      t.integer :income

      t.timestamps
    end
  end
end
