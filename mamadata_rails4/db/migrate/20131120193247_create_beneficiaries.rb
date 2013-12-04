class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.string :school_name
      t.string :school_type
      t.string :school_language
      t.string :school_class
      t.text :narrative_text
      t.string :status
      t.references :program, index: true
      t.references :godfather, index: true
      t.references :member, index: true
      t.timestamps
    end
  end
end
