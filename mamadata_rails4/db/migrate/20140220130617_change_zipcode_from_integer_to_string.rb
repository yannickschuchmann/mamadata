class ChangeZipcodeFromIntegerToString < ActiveRecord::Migration
  def change
  	change_column :supporters, :zipcode, :string
  end
end
