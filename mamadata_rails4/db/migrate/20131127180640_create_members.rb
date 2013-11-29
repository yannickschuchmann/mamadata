class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :beneficiary_id
      t.integer :program_id

      t.timestamps
    end
    add_index :members, :beneficiary_id
    add_index :members, :program_id
    add_index :members, [:beneficiary_id, :program_id], unique: true
  end
end
