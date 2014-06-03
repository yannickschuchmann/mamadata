class RemoveSchoolColumnsFromPerson < ActiveRecord::Migration
  def change
    remove_column :people, :school_name
    remove_column :people, :school_type
    remove_column :people, :school_language
    remove_column :people, :school_class
  end
end
