class CreateBeneficiaries < ActiveRecord::Migration
  def change
    create_table :beneficiaries do |t|
      t.references :program, index: true
      t.string :school_name
      t.string :school_type
      t.string :school_language
      t.string :school_class
      t.text :narrative_text
      t.references :godfather, index: true
      t.string :status

      t.timestamps
    end
  end
end
