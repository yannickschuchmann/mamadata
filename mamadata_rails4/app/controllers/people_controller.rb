class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    personParameters = ActionController::Parameters.new(params["person"])
    @person = Person.create(personParameters.permit(:name, :fathers_name, :gender, :date_of_birth, :place_of_birth, :native_place, :name_of_the_house, :number_of_the_house, :name_of_the_street, :city, :pin_code, :religion, :caste, :education, :marital_status, :health_condition, :occupation, :income, :role_id))
    if params["beneficiary"]
      beneficiaryParameters = ActionController::Parameters.new(params["beneficiary"])
      @beneficiary = Beneficiary.create(beneficiaryParameters.permit(:school_name))
    end
    # respond_to do |format|
    #   if @person.save
    #     format.html { redirect_to @person, notice: 'Person was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @person }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @person.errors, status: :unprocessable_entity }
    #   end
    # end
    render :json => @person
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:name, :fathers_name, :gender, :date_of_birth, :place_of_birth, :native_place, :name_of_the_house, :number_of_the_house, :name_of_the_street, :city, :pin_code, :religion, :caste, :education, :marital_status, :health_condition, :occupation, :income, :role_id, {:person => []})
    end
end
