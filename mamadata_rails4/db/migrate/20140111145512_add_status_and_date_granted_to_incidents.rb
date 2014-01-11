class AddStatusAndDateGrantedToIncidents < ActiveRecord::Migration
  def change
  	add_column :benefit_incidents, :date_granted, :date
  	add_column :benefit_incidents, :status, :boolean
  end
end
