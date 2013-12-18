class CreateFamily < ActiveRecord::Migration
  def change
  	create_table :families do |t|
  		t.references :person, index: true
  		t.references :community_development, index: true
  		t.string :name
  		t.references :head, index: true
  	end
  end
end
