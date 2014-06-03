class AddStreetNumberToSupporters < ActiveRecord::Migration
  def change
    add_column :supporters, :street_number, :string
  end
end
