class FamiliesController < ApplicationController
	before_action :set_family, only: [:show, :edit, :update, :destroy]
	
	def index
		@families = Family.all
	end
	def new
		@family = Family.new
		@person = Person.new
		# respond_to do |format|
		# 	format.html 
		# 	format.js 
		# end
	end

	def addpeople
		@person = Person.new
		respond_to do |format|
			format.js 
		end
	end
	def create
		puts params
	end
end