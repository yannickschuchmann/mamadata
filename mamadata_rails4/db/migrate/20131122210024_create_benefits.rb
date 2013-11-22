class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :name
      t.string :descriptioin

      t.timestamps
    end
  end
end
