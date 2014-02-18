class AddDeletedAtToBeneficiaryProgramRelationship < ActiveRecord::Migration
  def change
    add_column :beneficiary_program_relationships, :deleted_at, :datetime
  end
end
