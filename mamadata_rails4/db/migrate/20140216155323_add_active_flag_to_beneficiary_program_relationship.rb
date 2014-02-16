class AddActiveFlagToBeneficiaryProgramRelationship < ActiveRecord::Migration
  def change
    add_column :beneficiary_program_relationships, :is_active, :boolean, default: false	
  end
end
