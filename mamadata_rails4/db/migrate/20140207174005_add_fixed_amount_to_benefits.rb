class AddFixedAmountToBenefits < ActiveRecord::Migration
  def change
    add_column :benefits, :fixed_amount_paise, :integer
    add_column :benefits, :fixed_amount, :money
  end
end
