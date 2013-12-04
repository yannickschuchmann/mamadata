class CreateBenefitIncidents < ActiveRecord::Migration
  def change
    create_table :benefit_incidents do |t|
      t.references :person, index: true
      t.references :benefit, index: true
      t.references :program, index: true
      t.references :beneficiary, index: true
      # t.integer :person_id
      # t.integer :benefit_id
      # t.integer :program_id
      # t.integer :program_benefit_relationship_id
      t.integer :amount
      t.text :remark

      t.timestamps
    end
  end
end
