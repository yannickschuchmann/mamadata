class CreateFamily < ActiveRecord::Migration
  def change
  	create_table :familys do |t|
  		t.references :person, index: true
  		t.references :community_development, index: true
  		t.string :name #sollte aus dem benef. surname kommen!
  	end
  end
end
