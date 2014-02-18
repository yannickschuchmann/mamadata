class FamiliesController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_family, only: [:show, :edit, :update, :destroy]

	def index
		@families = Family.all
		@heads = []
		@families.each do |familie|
			if Person.find_by_id(familie.head_id.to_i).nil?
				@heads << Person.new(name: "Unknown")
			else
				@heads << Person.find_by_id(familie.head_id.to_i)
			end
		end
		#puts @heads
	end
	
	def destroy
		@family.destroy
		respond_to do |format|
			format.html { redirect_to families_url }
			format.json { head :no_content }
		end
	end
	def delete_relation
		@person = Person.find(params[:id])
		if !@person.nil?
			@person.family_id = ""
			@person.save
		end
		redirect_to families_path
	end

	def edit
	end

	def new
		@family = Family.new
	end

	def create
		@persons = JSON.parse params[:people]
		@family = Family.create()
		@community = CommunityDevelopment.create()
    @family.community_development_id = @community.id
		@persons.each do |value|
			person = Person.find(value["person_id"].to_i)
      person.update(role: Role.find_by_id(value["role"].to_i), family_id: @family.id)
      if person.role_id == 1
        @family.head_id = person.id
        @family.name = person.fathers_name
      end
		end
    @family.save
		render :json => @family
	end
	def show
		@community = CommunityDevelopment.find(@family.community_development_id)
	end

	private
	def set_family
		@family = Family.find(params[:id])
	end
end