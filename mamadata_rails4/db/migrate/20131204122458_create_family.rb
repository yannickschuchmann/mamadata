class CreateFamily < ActiveRecord::Migration
  def change
  	create_table :families do |t|
  		t.references :person, index: true
  		t.references :community_development, index: true
  		t.string :name
  		t.string :head
  	end
  end
end
