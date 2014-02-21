class ChangeIntegerValueForAmounts < ActiveRecord::Migration
  def change
  	change_column :benefit_incidents, :amount_paise, :integer, :limit => 8
  	change_column :benefit_incidents, :amount_in_euro_paise, :integer, :limit => 8
  	change_column :benefit_incidents, :amount_in_dollar_paise, :integer, :limit => 8
  	change_column :people, :income_paise, :integer, :limit => 8
  	change_column :benefits, :optional_amount_paise, :integer, :limit => 8
  	change_column :benefits, :fixed_amount_paise, :integer, :limit => 8
  	change_column :supporters, :donation_amount_paise, :integer, :limit => 8
  end
end
