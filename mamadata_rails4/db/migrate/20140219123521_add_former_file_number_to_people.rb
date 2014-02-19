class AddFormerFileNumberToPeople < ActiveRecord::Migration
  def change
    add_column :people, :file_number, :string, :default => ""
  end
end
