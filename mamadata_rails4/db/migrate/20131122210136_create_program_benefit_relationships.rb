class CreateProgramBenefitRelationships < ActiveRecord::Migration
  def change
    create_table :program_benefit_relationships do |t|
      t.references :program, index: true
      t.references :benefit, index: true
      t.timestamps
    end
    # add_index :program_benefit_relationships, [:program_id, :benefit_id], unique: true, name: 'prog_ben_index'
  end
end
