class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.references :person, index: true
      t.text :text
      t.datetime :date

      t.timestamps
    end
  end
end
