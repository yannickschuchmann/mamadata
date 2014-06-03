class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.references :person, index: true
      t.string :name
      t.string :type
      t.text :remark
      t.string :language

      t.timestamps
    end
  end
end
