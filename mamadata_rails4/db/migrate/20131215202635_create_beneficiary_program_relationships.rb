class CreateBeneficiaryProgramRelationships < ActiveRecord::Migration
  def change
    create_table :beneficiary_program_relationships do |t|
    	t.references :program, index: true
      t.references :person, index: true
      t.timestamps
    end
  end
end
