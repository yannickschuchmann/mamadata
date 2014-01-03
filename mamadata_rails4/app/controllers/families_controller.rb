class FamiliesController < ApplicationController
	  before_filter :authenticate_user!
	  # before_action :set_family, only: [:show, :edit, :update, :destroy]
	
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
		puts @heads
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
		@persons.each do |key,value|
			people = @family.people.create(name: value["name"], fathers_name: value["fname"], role: Role.find_by_id(value["role_id"].to_i))
			if value["role_id"].to_i == 1
				@family.head_id = people.id
				@family.save
			end
		end
		render :json => @family
	end
	def show
	end
end