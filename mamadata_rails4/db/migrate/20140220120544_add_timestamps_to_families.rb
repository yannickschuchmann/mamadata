class AddTimestampsToFamilies < ActiveRecord::Migration
	def change
		change_table :families do |t|
			t.timestamps
		end	
	end
end
