class BenefitIncidentsController < ApplicationController
  before_action :set_benefit_incident, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :js, :html
  
  # GET /benefit_incidents
  # GET /benefit_incidents.json
  def index
    @benefit_incidents = BenefitIncident.all.order(created_at: :desc)
  end

  def calculated
    @amount = Money.new(0);
    @benefit_incidents = BenefitIncident.find(params[:array])
    @benefit_incidents.each do |b|
      @amount += b.amount
    end
  respond_to do |format|
    format.js {}
  end
    respond_with @amount
  end

  def list
      @benefit_incidents = BenefitIncident.where(person_id: params[:person_id]) unless list_for_all_users?
      @benefit_incidents = BenefitIncident.all if list_for_all_users?
      
      all_benefits_with_status false if params[:status] == "false"
      all_benefits_with_status true if params[:status] == "true"
      add_date_filter unless (params[:date_from].empty? && params[:date_to].empty?)

  respond_to do |format|
    format.js {}
  end
    respond_with @benefit_incidents
  end


  def add_user_to_program
    @person = Person.find(params[:person_id])
  end

  # GET /benefit_incidents/1
  # GET /benefit_incidents/1.json
  def show
  end

  # GET /benefit_incidents/new
  def new
    @benefit_incident = BenefitIncident.new(person_id: params[:person_id])
    set_variables_for_javascript
  end

  # GET /benefit_incidents/1/edit
  def edit
    set_variables_for_javascript
    @benefits = @benefit_incident.program.benefits
  end

  # POST /benefit_incidents
  # POST /benefit_incidents.json
  def create
    @benefit_incident = BenefitIncident.new(benefit_incident_params)
    set_variables_for_javascript
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
    set_variables_for_javascript
    respond_to do |format|
      if @benefit_incident.update(benefit_incident_params)
        format.html { redirect_to @benefit_incident, notice: 'Benefit incident was successfully updated.' }
        format.json { head :no_content }
        format.js {}
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
      format.html { redirect_to person_path(@benefit_incident.person, anchor: "panel2-4") }
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
      params.require(:benefit_incident).permit(:person_id, :program_id, :benefit_id, :amount, :remark, :status, :date_granted)
    end

    def set_variables_for_javascript
      @all_programs = Hash[Program.all.map { |p| [p.id, p.name] }]
      @person = @benefit_incident.person
      @data = Hash[Program.all.map{|p| [p.id, p.benefits]}]
      @benefits_with_calculated_amount = Hash[Benefit.where(category: "calculated").map {|b| [b.id, (b.optional_amount_paise/b.max_people)]}]
      @benefits_with_fixed_amount = Hash[Benefit.where(category: "fixed").map {|b| [b.id, b.fixed_amount_paise]}]
      @all_benefits = Hash[Benefit.all.map { |p| [p.id, p.category] }]
      @benefits = []
    end

    def all_benefits_with_status(status)
      @benefit_incidents = @is_all ? BenefitIncident.where(status: status) : BenefitIncident.where(person_id: params[:person_id], status: status)
    end

    def add_date_filter
      @benefit_incidents=@benefit_incidents.where("created_at >= ?",  params[:date_from])
      @benefit_incidents = @benefit_incidents.where("created_at <= ?",  params[:date_to])
    end

    def list_for_all_users?
      if params[:person_id] == "all"
        @is_all = true
        return true
      end
      return false
    end

end
