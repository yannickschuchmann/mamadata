class CreateBenefitIncidents < ActiveRecord::Migration
  def change
    create_table :benefit_incidents do |t|
      t.integer :person_id
      t.integer :benefit_id
      t.integer :program_id
      # t.integer :program_benefit_relationship_id
      t.integer :amount
      t.text :remark

      t.timestamps
    end
  end
end
