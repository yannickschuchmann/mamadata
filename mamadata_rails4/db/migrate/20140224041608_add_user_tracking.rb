class AddUserTracking < ActiveRecord::Migration
  def change
  	add_column :people, :created_by, :integer
  	add_column :beneficiary_program_relationships, :added_by, :integer
  	add_column :beneficiary_program_relationships, :deleted_by, :integer
  	add_column :benefit_incidents, :created_by, :integer
  	add_column :benefit_incidents, :granted_by, :integer
  end
end
