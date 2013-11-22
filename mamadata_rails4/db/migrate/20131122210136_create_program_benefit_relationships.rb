class CreateProgramBenefitRelationships < ActiveRecord::Migration
  def change
    create_table :program_benefit_relationships do |t|
      t.integer :program_id
      t.integer :benefit_id

      t.timestamps
    end
  end
end
