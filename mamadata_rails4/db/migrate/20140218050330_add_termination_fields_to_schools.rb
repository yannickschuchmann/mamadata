class AddTerminationFieldsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :terminated_at, :date
    add_column :schools, :termination_reason, :string
    add_column :schools, :termination_remark, :text
  end
end
