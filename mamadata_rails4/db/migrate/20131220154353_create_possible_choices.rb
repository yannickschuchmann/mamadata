class CreatePossibleChoices < ActiveRecord::Migration
  def change
    create_table :possible_choices do |t|
      t.string :property
      t.string :value

      t.timestamps
    end
  end
end
