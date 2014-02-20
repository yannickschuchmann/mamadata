class AddPositionInOrganisation < ActiveRecord::Migration
	def change
		add_column :supporters, :position_in_organisation, :string	
	end
end
