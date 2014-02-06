class CreateBenefitIncidents < ActiveRecord::Migration
  def change
    create_table :benefit_incidents do |t|
      t.references :person, index: true
      t.references :benefit, index: true
      t.references :program, index: true
      t.integer :amount_paise
      t.money :amount
      t.text :remark
      
      t.timestamps
    end
  end
end
