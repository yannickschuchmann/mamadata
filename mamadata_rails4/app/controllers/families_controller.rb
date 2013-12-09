class FamiliesController < ApplicationController
	# before_action :set_family, only: [:show, :edit, :update, :destroy]
	
	def index
		@families = Family.all
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
		puts "CREATEEEEEEEEEEEEEEEEEEe"
		puts params
		puts "ENNNNNNNNNNNNNDDDDDDDDDD"
		@persons = params[:person]
		@family = Family.create(name:params[:familyname],head:params[:familyname])
		@persons.each do |key,value|
			@family.people.create(name: value["name"], fathers_name: value["fname"], role: Role.find_by_id(value["role_id"].to_i))
		end
		render :json => @family
	end
	def show
	end
end