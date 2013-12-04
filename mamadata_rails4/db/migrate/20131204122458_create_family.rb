class CreateFamily < ActiveRecord::Migration
  def change
  	create_table :familys do |t|
  		t.references :person, index: true
  		t.references :community_development, index: true
  	end
  end
end
