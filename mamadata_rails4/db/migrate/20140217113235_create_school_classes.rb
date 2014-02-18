class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.string :name
      t.references :school, index: true
      t.attachment :document
      t.text :remark

      t.timestamps
    end
  end
end
