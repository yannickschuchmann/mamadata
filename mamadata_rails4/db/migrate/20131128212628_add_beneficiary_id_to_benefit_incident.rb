class AddBeneficiaryIdToBenefitIncident < ActiveRecord::Migration
  def change
  	add_column :benefit_incidents, :beneficiary_id, :integer
  end
end
