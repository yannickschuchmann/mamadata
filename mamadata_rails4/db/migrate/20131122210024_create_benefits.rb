class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
