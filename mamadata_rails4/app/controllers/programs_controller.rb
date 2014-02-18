class ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
    @data = Program.all.map { |p| [p.name, p.benefits]  }
  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    @benefit_incidents = BenefitIncident.where(program_id: params[:id])

    @program_participants = BeneficiaryProgramRelationship.with_deleted.where(program_id: params[:id]).order("created_at DESC")

    total_amount_pending=Money.new(0)
    @benefit_incidents.each do |benefit|
      if(benefit.status == false)
        total_amount_pending+=benefit.amount
      end
    end
    @total_amount_pending = total_amount_pending


    total_amount_granted=Money.new(0)
    @benefit_incidents.each do |benefit|
      if(benefit.status == true)
        total_amount_granted+=benefit.amount
      end
    end
    @total_amount_granted = total_amount_granted
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  def benefits
    @program = Program.find(params[:id])
    render 'show'
  end

  # POST /programs
  # POST /programs.json
  def create
    @program = Program.new(program_params)

    respond_to do |format|
      if @program.save
        format.html { redirect_to @program, notice: 'Program was successfully created.' }
        format.json { render action: 'show', status: :created, location: @program }
      else
        format.html { render action: 'new' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /programs/1
  # PATCH/PUT /programs/1.json
  def update
    respond_to do |format|
      if @program.update(program_params)
        format.html { redirect_to @program, notice: 'Program was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program.destroy
    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def program_params
      params.require(:program).permit(:name, :description, :benefit_ids => [])
    end
end
