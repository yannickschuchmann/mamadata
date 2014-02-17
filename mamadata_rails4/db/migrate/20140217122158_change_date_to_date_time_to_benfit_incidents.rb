class ChangeDateToDateTimeToBenfitIncidents < ActiveRecord::Migration
 def up
   change_column :benefit_incidents, :date_granted, :datetime
  end

  def down
   change_column :benefit_incidents, :date_granted, :date
  end
end
