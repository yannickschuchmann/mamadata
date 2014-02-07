class AddFixedAmountToBenefits < ActiveRecord::Migration
  def change
    add_money :benefits, :fixed_amount
  end
end
