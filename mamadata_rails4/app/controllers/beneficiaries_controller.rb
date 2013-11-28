class BeneficiariesController < ApplicationController
  before_action :set_beneficiary, only: [:show, :edit, :update, :destroy]

  # GET /beneficiaries
  # GET /beneficiaries.json
  def index
    @beneficiaries = Beneficiary.all
  end

  # GET /beneficiaries/1
  # GET /beneficiaries/1.json
  def show
  end

  # GET /beneficiaries/new
  def new
    @beneficiary = Beneficiary.new
    3.times {@beneficiary.programs.build}
  end

  # GET /beneficiaries/1/edit
  def edit
  end

  # POST /beneficiaries
  # POST /beneficiaries.json
  def create
    @beneficiary = Beneficiary.new(beneficiary_params)

    respond_to do |format|
      if @beneficiary.save
        format.html { redirect_to @beneficiary, notice: 'Beneficiary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @beneficiary }
      else
        format.html { render action: 'new' }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beneficiaries/1
  # PATCH/PUT /beneficiaries/1.json
  def update
    respond_to do |format|
      if @beneficiary.update(beneficiary_params)
        format.html { redirect_to @beneficiary, notice: 'Beneficiary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @beneficiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beneficiaries/1
  # DELETE /beneficiaries/1.json
  def destroy
    @beneficiary.destroy
    respond_to do |format|
      format.html { redirect_to beneficiaries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beneficiary
      @beneficiary = Beneficiary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beneficiary_params
      params.require(:beneficiary).permit(:member_id, :school_name, :school_type, :school_language, :school_class, :narrative_text, :godfather_id, :status)
    end
end
