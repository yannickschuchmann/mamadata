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
		# @family = Family.new
		# @person = Person.new
		# respond_to do |format|
		# 	format.html 
		# 	format.js 
		# end
	end

	# def addpeople
	# 	@person = Person.new
	# 	respond_to do |format|
	# 		format.js 
	# 	end
	# end
	
	def create
		@persons = params[:person]
		@family = Family.create(name:params[:familyname])
		@community = CommunityDevelopment.create(params[:id])
		@persons.each do |key,value|
			Person.find(value["id"]).update(role: Role.find_by_id(value["role_id"].to_i))
			Person.find(value["id"]).update(family_id: @family.id)
			@family.community_development_id = @community.id
			if value["role_id"].to_i == 1
				@family.head_id = value["id"]
			end
			@family.save
		end
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