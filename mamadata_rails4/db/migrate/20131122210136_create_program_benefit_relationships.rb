class CreateProgramBenefitRelationships < ActiveRecord::Migration
  def change
    create_table :program_benefit_relationships do |t|
      t.integer :program_id
      t.integer :benefit_id

      t.timestamps
    end
    add_index :program_benefit_relationships, :program_id
    add_index :program_benefit_relationships, :benefit_id
    add_index :program_benefit_relationships, [:program_id, :benefit_id], unique: true, name: 'prog_ben_index'
  end
end
