class AddSpaltenToBeneficiaries < ActiveRecord::Migration
  def change
    add_column :beneficiaries, :narrative_text, :text
    add_column :beneficiaries, :school_name, :string
    add_column :beneficiaries, :school_type, :string
    add_column :beneficiaries, :school_class, :string
    add_column :beneficiaries, :health_condition, :string
  end
end
