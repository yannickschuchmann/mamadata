class AddExitDateToBeneficiaryProgramRelationship < ActiveRecord::Migration
  def change
    add_column :beneficiary_program_relationships, :exit_date, :date
  end
end
