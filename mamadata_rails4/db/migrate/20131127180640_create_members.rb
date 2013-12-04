class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :program, index: true
      t.references :beneficiary, index: true
    
      t.timestamps
    end
  end
end
