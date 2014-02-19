class ChangeZipCodeFormat < ActiveRecord::Migration
	def change
		change_column :people, :zip_code, :string
	end
end
