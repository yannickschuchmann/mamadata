class AddDonorFieldsToSupporter < ActiveRecord::Migration
  def change
    add_column :supporters, :is_donor, :boolean
    add_money :supporters, :donation_amount, amount: { null: true, default: nil }
    add_column :supporters, :donor_type_id, :integer
  end
end

