class BenefitIncidentsController < ApplicationController
  before_action :set_benefit_incident, only: [:show, :edit, :update, :destroy]

  # GET /benefit_incidents
  # GET /benefit_incidents.json
  def index
    @benefit_incidents = BenefitIncident.all
  end

  # GET /benefit_incidents/1
  # GET /benefit_incidents/1.json
  def show
        # program_id = ProgramBenefitRelationship.find_by(id: @benefit_incident.program_benefit_relationship_id).program_id
        # @program = Program.find_by(id: program_id)
        # benefit_id = ProgramBenefitRelationship.find_by(id: @benefit_incident.program_benefit_relationship_id).benefit_id
        # @benefit = Benefit.find_by(id: benefit_id)
  end

  # GET /benefit_incidents/new
  def new
    @benefit_incident = BenefitIncident.new
    @programs = Program.all
    @benefits = Benefit.all
  end

  # GET /benefit_incidents/1/edit
  def edit
  end

  # POST /benefit_incidents
  # POST /benefit_incidents.json
  def create
    @benefit_incident = BenefitIncident.new(benefit_incident_params)

    respond_to do |format|
      if @benefit_incident.save
        format.html { redirect_to @benefit_incident, notice: 'Benefit incident was successfully created.' }
        format.json { render action: 'show', status: :created, location: @benefit_incident }
      else
        format.html { render action: 'new' }
        format.json { render json: @benefit_incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefit_incidents/1
  # PATCH/PUT /benefit_incidents/1.json
  def update
    respond_to do |format|
      if @benefit_incident.update(benefit_incident_params)
        format.html { redirect_to @benefit_incident, notice: 'Benefit incident was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @benefit_incident.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefit_incidents/1
  # DELETE /benefit_incidents/1.json
  def destroy
    @benefit_incident.destroy
    respond_to do |format|
      format.html { redirect_to benefit_incidents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit_incident
      @benefit_incident = BenefitIncident.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def benefit_incident_params
      params.require(:benefit_incident).permit(:person_id, :program_benefit_relationship_id, :amount, :remark)
    end
end