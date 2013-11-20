class CreateCommunityDevelopments < ActiveRecord::Migration
  def change
    create_table :community_developments do |t|
      t.references :head_of_household
      t.string :type_of_family
      t.string :residental_status
      t.string :house_posession
      t.string :house_type
      t.boolean :electricity
      t.string :water_from
      t.boolean :toilet_facility
      t.boolean :rain_harvesting
      t.boolean :want_rain_harvesting
      t.integer :earning_members_of_family
      t.string :source_of_income
      t.string :land_details
      t.boolean :any_savings
      t.string :mode_of_savings
      t.boolean :debts
      t.string :reason_for_debt
      t.string :family_members_addicted_to
      t.string :family_members_addicted_who
      t.boolean :family_disabled
      t.string :family_type_of_handicap
      t.boolean :family_chronic_deseases
      t.string :family_chronic_deseases_which
      t.boolean :family_children_vaccined
      t.boolean :family_knowledge_of_family_planning
      t.boolean :family_undergone_family_planning
      t.boolean :home_remedies_for_illnesses
      t.string :illness_treatment
      t.boolean :family_school_dropout
      t.text :family_dropout_reason_for
      t.text :family_dropout_present_condition
      t.string :family_skilled_in_art

      t.timestamps
    end
  end
end
