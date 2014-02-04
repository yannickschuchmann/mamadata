class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :name
      t.string :description
      t.integer :optional_amount_paise
      t.money :optional_amount, amount: { null: true, default: nil }

      t.timestamps
    end
  end
end
