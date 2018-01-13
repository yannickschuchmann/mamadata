class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.belongs_to :community_development, index: true
      t.string :name
      t.string :age
      t.string :sex
      t.string :relationship_beneficiary
      t.string :religion
      t.string :caste
      t.string :educational_qualification
      t.string :occupation
      t.string :income
      t.string :employment_kind
      t.string :pension
      t.boolean :aadhar_card
      t.boolean :voters_id
      t.boolean :bank_account
      t.boolean :shg
      t.boolean :criminal_cases
      t.boolean :physically_challenged
      t.string :illness
      t.boolean :alcoholic

      t.timestamps
    end
  end
end
