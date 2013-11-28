class RemoveProgramFromBeneficiaries < ActiveRecord::Migration
  def change
    remove_column :beneficiaries, :program_id, :integer
    add_column :beneficiaries, :member_id, :integer
  end
end
