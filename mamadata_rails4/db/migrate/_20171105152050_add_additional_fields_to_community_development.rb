class AddAdditionalFieldsToCommunityDevelopment < ActiveRecord::Migration
  def change
    add_column :community_developments, :house_id, :string
    add_column :community_developments, :location, :string
    add_column :community_developments, :door_number, :string
    add_column :community_developments, :street_name, :string
    add_column :community_developments, :respondent, :string
    add_column :community_developments, :number_people_in_household, :string
    add_column :community_developments, :number_adults, :string
    add_column :community_developments, :number_children, :string
    add_column :community_developments, :number_boys, :string
    add_column :community_developments, :number_girls, :string
    add_column :community_developments, :number_beneficiaries, :string
    add_column :community_developments, :electricity, :boolean
    add_column :community_developments, :water, :boolean
    add_column :community_developments, :toilet, :boolean
    add_column :community_developments, :bathroom, :boolean
    add_column :community_developments, :good_ventilation, :boolean
    add_column :community_developments, :source_drinking_water, :string
    add_column :community_developments, :source_water_other_use, :string
    add_column :community_developments, :distance_water_sources, :string
    add_column :community_developments, :fuel_cooking, :string
    add_column :community_developments, :number_meals_daily, :string
    add_column :community_developments, :television, :boolean
    add_column :community_developments, :washing_machine, :boolean
    add_column :community_developments, :refrigerator, :boolean
    add_column :community_developments, :ac, :boolean
    add_column :community_developments, :smartphone, :boolean
    add_column :community_developments, :feature_phone, :boolean
    add_column :community_developments, :cycle, :boolean
    add_column :community_developments, :motorcycle, :boolean
    add_column :community_developments, :bdes, :boolean
    add_column :community_developments, :fans, :boolean
    add_column :community_developments, :migration, :string
    add_column :community_developments, :own_land, :boolean
    add_column :community_developments, :own_cattle, :boolean
    add_column :community_developments, :approx_household_income, :string
    add_column :community_developments, :exact_income, :string
    add_column :community_developments, :approx_household_expenditure, :string
    add_column :community_developments, :marital_status_parent, :string
    add_column :community_developments, :number_children_in_school, :string
    add_column :community_developments, :number_children_not_in_school, :string
    add_column :community_developments, :number_children_dropped_out, :string
    add_column :community_developments, :number_children_in_govt_aided_school, :string
    add_column :community_developments, :number_children_in_govt_school, :string
    add_column :community_developments, :number_children_in_private_school, :string
    add_column :community_developments, :number_children_coming_for_tuition, :string
    add_column :community_developments, :number_children_not_coming_for_tuition, :string
    add_column :community_developments, :number_children_gayatri_creche, :string
    add_column :community_developments, :number_children_gayatri_pre_school, :string
    add_column :community_developments, :number_children_gayatri_drop_in, :string
    add_column :community_developments, :number_people_mobile_library, :string
    add_column :community_developments, :number_children_sponsored_by_sharana, :string
    add_column :community_developments, :total_debt, :string

    # better to have multiple select
    add_column :community_developments, :origin_loan_bank, :boolean
    add_column :community_developments, :origin_loan_chits, :boolean
    add_column :community_developments, :origin_loan_private_lender, :boolean
    add_column :community_developments, :origin_loan_shg, :boolean
    add_column :community_developments, :origin_loan_relatives, :boolean

    # better to have multiple select
    add_column :community_developments, :reasons_loan_food, :boolean
    add_column :community_developments, :reasons_loan_housing, :boolean
    add_column :community_developments, :reasons_loan_household_items, :boolean
    add_column :community_developments, :reasons_loan_education, :boolean
    add_column :community_developments, :reasons_loan_hospitalisation, :boolean
    add_column :community_developments, :reasons_loan_profession, :boolean
    add_column :community_developments, :reasons_loan_functions, :boolean
    add_column :community_developments, :reasons_loan_marriage, :boolean

    # better to have multiple select
    add_column :community_developments, :children_immunised_tetanus, :boolean
    add_column :community_developments, :children_immunised_bcg, :boolean
    add_column :community_developments, :children_immunised_dtp, :boolean
    add_column :community_developments, :children_immunised_hep_b, :boolean
    add_column :community_developments, :children_immunised_polio, :boolean
    add_column :community_developments, :children_immunised_measles, :boolean
    add_column :community_developments, :children_immunised_small_pox, :boolean

    # better to have multiple select
    add_column :community_developments, :alcoholism_no_problems, :boolean
    add_column :community_developments, :alcoholism_early_death, :boolean
    add_column :community_developments, :alcoholism_job_lost, :boolean
    add_column :community_developments, :alcoholism_family_dispute, :boolean
    add_column :community_developments, :alcoholism_physical_abuse, :boolean
    add_column :community_developments, :alcoholism_health_issue, :boolean
    add_column :community_developments, :alcoholism_debt_loans, :boolean
    add_column :community_developments, :alcoholism_marital_issues, :boolean
    add_column :community_developments, :alcoholism_reduced_household_income, :boolean

    add_column :community_developments, :children_attend_health_camps, :boolean
    add_column :community_developments, :daily_alcohol_expenses, :string
    add_column :community_developments, :marriagleable_age_girl, :string
    add_column :community_developments, :marriagleable_age_boy, :string
    add_column :community_developments, :treat_boys_girls_equally, :string
    add_column :community_developments, :treat_boys_girls_equally, :string
    add_column :community_developments, :domestic_violence, :boolean

    add_column :community_developments, :number_people_illness, :string
    add_column :community_developments, :number_people_physically_challenged, :string
    add_column :community_developments, :number_monthly_doctor_visits, :string
    add_column :community_developments, :medical_expenses, :string
    add_column :community_developments, :regularly_toilet_cleaning, :boolean
    add_column :community_developments, :defecate_in_open, :boolean
    add_column :community_developments, :dustbin_usage, :boolean
    add_column :community_developments, :garbage_dumped_to, :string
    add_column :community_developments, :segregate_waste, :boolean
    add_column :community_developments, :habit_washing_hands, :boolean
    add_column :community_developments, :soap_usage, :boolean
    add_column :community_developments, :sanitary_napkin_usage, :boolean
    add_column :community_developments, :contraceptives_awareness, :boolean
    add_column :community_developments, :contraceptives_usage, :boolean
    add_column :community_developments, :skilled_arts_received_training, :boolean
    add_column :community_developments, :skilled_arts_earning_after_training, :boolean
    add_column :community_developments, :skilled_arts_hobby_doing, :boolean
    add_column :community_developments, :skilled_arts_acquired_skill_earning, :boolean
    add_column :community_developments, :skilled_arts_what_to_develop, :string
    add_column :community_developments, :skilled_arts_what_to_earn, :string
    add_column :community_developments, :govt_schemes_availed, :string
    add_column :community_developments, :govt_schemes_found_out, :string
    add_column :community_developments, :children_school_dropout, :boolean
    add_column :community_developments, :children_school_dropout_reason, :string
    add_column :community_developments, :children_school_dropout_condition, :string
  end
end
