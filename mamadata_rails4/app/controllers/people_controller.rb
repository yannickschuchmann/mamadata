class PeopleController < ApplicationController
	before_action :set_person, only: [:show, :edit, :update, :destroy]
	before_filter :set_autosuggest, only: [:edit, :new]
	before_filter :authenticate_user!
	
	# GET /people
	# GET /people.json
	def index
		@people = Person.all
	end

	# GET /people/1
	# GET /people/1.json
	def show
		@benefit_incidents = BenefitIncident.where(person_id: params[:id])
		@schools = School.where(person_id: params[:id]).order(joined_at: :desc)
		@godfather_relations = GodfatherPerson.with_deleted.where(person_id: params[:id]).order(created_at: :desc)
		@godfathers = []
		@godfather_relations.each do |r|
			@godfathers << Supporter.find(r.godfather_id)
		end

	end

	# GET /people/new
	def new
		@person = Person.new
	end

	def add_to_program
		@person = Person.find(params[:id])
	end

	# GET /people/1/edit
	def edit
		if params[:section] == "programs"
			render partial: 'program_checkboxes'
		end
	end

	# POST /people
	# POST /people.json
	def create
		@person = Person.create(person_params)
		# personParameters = ActionController::Parameters.new(params["person"])
		# @person = Person.create(personParameters.permit(:name, :fathers_name, :gender, :date_of_birth, :place_of_birth, :native_place, :name_of_the_house, :number_of_the_house, :name_of_the_street, :city, :pin_code, :religion, :caste, :education, :marital_status, :health_condition, :occupation, :income, :role_id, :school_name, :school_type, :school_language, :school_class, :narrative_text,:avatar , :status,:program_ids => []))
#    if params["beneficiary"]
#     beneficiaryParameters = ActionController::Parameters.new(params["beneficiary"])
#    @beneficiary = Beneficiary.create(beneficiaryParameters.permit(:school_name))
#    end
respond_to do |format|
	if @person.save
		format.html { redirect_to @person, notice: 'Person was successfully created.' }
		format.json { render action: 'show', status: :created, location: @person }
	else
		format.html { render action: 'new' }
		format.json { render json: @person.errors, status: :unprocessable_entity }
	end
end
end

	# PATCH/PUT /people/1
	# PATCH/PUT /people/1.json
	def update
		respond_to do |format|
			if @person.update(person_params)
				if params[:redirect_to_incident] == 'true'
					format.html { redirect_to new_benefit_incident_path(@person), notice: 'Person was successfully updated.' }
				elsif params[:redirect_to_user] == 'true'
					format.html {redirect_to edit_person_path(@person)}
				end
				format.html { redirect_to @person, notice: 'Person was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @person.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /people/1
	# DELETE /people/1.json
	def destroy
		@person.destroy
		respond_to do |format|
			format.html { redirect_to people_url }
			format.json { head :no_content }
		end
	end

	def search
		name = params['name']
		fname = params['fname']
		city = params['city']
		zipcode = params['zipcode']

		result = []
		
		result = Person.where("name LIKE ? AND fathers_name LIKE ? ", "%#{name}%","%#{fname}%")
		
		respond_to do |format|
			# format.html # index.html.erb
			format.json { render json: result }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_autosuggest
			@AutoCities = Person.select('distinct city').collect { |p| p.city.camelize }
			@AutoNames  = Person.select('distinct fathers_name').collect { |p| p.fathers_name.camelize }
		end
		def set_person
			@person = Person.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def person_params
			params.require(:person).permit(:name, :fathers_name, :file_number, :gender, :date_of_birth, :place_of_birth, :native_place, :name_of_the_house, :number_of_the_house, :name_of_the_street, :city, :area, :zip_code, :religion, :caste, :education, :marital_status, :health_condition, :occupation, :income, :role_id, :school_name, :school_type, :school_language, :school_class, :narrative_text,:avatar, :status, :godfather_ids, :program_ids => [])
		end
	end
