class AddFixedAmountToBenefits < ActiveRecord::Migration
  def change
    add_money :benefits, :fixed_amount, amount: { null: true, default: nil }
  end
end
