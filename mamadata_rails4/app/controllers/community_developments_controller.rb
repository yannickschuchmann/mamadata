class CommunityDevelopmentsController < ApplicationController
	before_action :set_community_development, only: [:edit, :update, :destroy]
	before_filter :authenticate_user!
	
	# PATCH/PUT /community_developments/1
	# PATCH/PUT /community_developments/1.json
	def update
		#remove empty array fields!
		community_development_params["family_skilled_in_art"].reject!(&:empty?)
		community_development_params["illness_treatment"].reject!(&:empty?)
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
			params.require(:community_development).permit(:id, :head_of_household_id, :type_of_family, :residental_status, :house_posession, :house_type, :electricity, :water_from, :toilet_facility, :rain_harvesting, :want_rain_harvesting, :earning_members_of_family, :source_of_income, :land_details, :any_savings, :mode_of_savings, :debts, :reason_for_debt, :family_members_addicted_to, :family_members_addicted_who, :family_disabled, :family_type_of_handicap, :family_chronic_deseases, :family_chronic_deseases_which, :family_children_vaccined, :family_knowledge_of_family_planning, :family_undergone_family_planning, :home_remedies_for_illnesses, :family_school_dropout, :family_dropout_reason_for, :family_dropout_present_condition, {:family_skilled_in_art => []},{:illness_treatment => []})
		end
	end
