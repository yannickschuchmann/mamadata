class CommunityDevelopmentsController < ApplicationController
	before_action :set_community_development, only: [:edit,
:update,
:destroy]

	# PATCH/PUT /community_developments/1
	# PATCH/PUT /community_developments/1.json
	def update
		#remove empty array fields!
		[
			"family_skilled_in_art",
			"illness_treatment",
			"facilities",
			"mode_of_savings",
			"origin_loan",
			"reasons_loan",
			"alcoholism_problems",
			"children_immunised"
		].each do |field|
			community_development_params[field].reject!(&:empty?) unless community_development_params[field].nil?
		end

		respond_to do |format|
			if @community_development.update(community_development_params)
				format.html { redirect_to @community_development.family, notice: 'Community development was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @community_development.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /community_developments/1
	# DELETE /community_developments/1.json
	def destroy
		@community_development.destroy
		respond_to do |format|
			format.html { redirect_to community_developments_url }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_community_development
			@community_development = CommunityDevelopment.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def community_development_params
			params.require(:community_development).permit(
				:id,
				:family,
				:type_of_family,
				:residental_status,
				:house_possession,
				:house_type,
				:electricity,
				:water_from,
				:toilet_facility,
				:rain_harvesting,
				:want_rain_harvesting,
				:earning_members_of_family,
				:source_of_income,
				:land_details,
				:any_savings,
				{
					:mode_of_savings => []
				},
				:debts,
				:reason_for_debt,
				:family_members_addicted_to,
				:family_members_addicted_who,
				:family_disabled,
				:family_type_of_handicap,
				:family_chronic_deseases,
				:family_chronic_deseases_which,
				:family_children_vaccined,
				:family_knowledge_of_family_planning,
				:family_undergone_family_planning,
				:home_remedies_for_illnesses,
				:family_school_dropout,
				:family_dropout_reason_for,
				:family_dropout_present_condition,
				{
					:family_skilled_in_art => []
				},
				{
					:illness_treatment => []
				},
				:house_id,
				:location,
				:door_number,
				:street_name,
				:respondent,
				:number_people_in_household,
				:number_adults,
				:number_children,
				:number_boys,
				:number_girls,
				:number_beneficiaries,
				{
					:facilities => []
				},
				:source_drinking_water,
				:source_water_other_use,
				:distance_water_sources,
				:fuel_cooking,
				:number_meals_daily,
				:television,
				:washing_machine,
				:refrigerator,
				:ac,
				:smartphone,
				:feature_phone,
				:cycle,
				:motorcycle,
				:beds,
				:fans,
				:migration,
				:own_land,
				:own_cattle,
				:approx_household_income,
				:exact_income,
				:approx_household_expenditure,
				:marital_status_parent,
				:number_children_in_school,
				:number_children_not_in_school,
				:number_children_dropped_out,
				:number_children_in_govt_aided_school,
				:number_children_in_govt_school,
				:number_children_in_private_school,
				:number_children_coming_for_tuition,
				:number_children_not_coming_for_tuition,
				:number_children_gayatri_creche,
				:number_children_gayatri_pre_school,
				:number_children_gayatri_drop_in,
				:number_people_mobile_library,
				:number_children_sponsored_by_sharana,
				:total_debt,
				:family_undergone_family_planning_revised,
				{
					:origin_loan => []
				},
				{
					:reasons_loan => []
				},
				{
					:children_immunised => [],
				},
				{
					:alcoholism_problems => [],
				},
				:children_attend_health_camps,
				:daily_alcohol_expenses,
				:marriageable_age_girl,
				:marriageable_age_boy,
				:treat_boys_girls_equally,
				:domestic_violence,
				:number_people_illness,
				:number_people_physically_challenged,
				:number_monthly_doctor_visits,
				:medical_expenses,
				:regularly_toilet_cleaning,
				:defecate_in_open,
				:dustbin_usage,
				:garbage_dumped_to,
				:segregate_waste,
				:habit_washing_hands,
				:soap_usage,
				:sanitary_napkin_usage,
				:contraceptives_awareness,
				:contraceptives_usage,
				:skilled_arts_received_training,
				:skilled_arts_earning_after_training,
				:skilled_arts_hobby_doing,
				:skilled_arts_acquired_skill_earning,
				:skilled_arts_what_to_develop,
				:skilled_arts_what_to_earn,
				:govt_schemes_availed,
				:govt_schemes_found_out,
				:guardians_attributes => [
					:id,
					:name,
					:age,
					:sex,
					:relationship_beneficiary,
					:religion,
					:caste,
					:educational_qualification,
					:occupation,
					:income,
					:employment_kind,
					:pension,
					:aadhar_card,
					:voters_id,
					:bank_account,
					:shg,
					:criminal_cases,
					:physically_challenged,
					:illness,
					:alcoholic
				]
			)
		end
	end
