class AddCategoryToBenefits < ActiveRecord::Migration
  def change
    add_column :benefits, :category, :string
  end
end
