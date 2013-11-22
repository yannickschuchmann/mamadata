class CreateBenefitIncidents < ActiveRecord::Migration
  def change
    create_table :benefit_incidents do |t|
      t.integer :user_id
      t.integer :program_benefit_relationship_id
      t.integer :amount
      t.string :remark

      t.timestamps
    end
  end
end
