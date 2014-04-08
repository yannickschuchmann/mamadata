class BenefitsController < ApplicationController
  before_action :set_benefit, only: [:show, :edit, :update, :destroy]

  layout "application_main_sidebar"

  # GET /benefits
  # GET /benefits.json
  def index
    @benefits = Benefit.all.order(created_at: :desc)
  end


  def report
    @benefits = Benefit.find(params[:ids])
    render :xlsx => "xlsreport", :filename => "benefit_report_#{DateTime.now.to_i.to_s}.xlsx"
  end


  # GET /benefits/1
  # GET /benefits/1.json
  def show

  end

  # GET /benefits/new
  def new
    @benefit = Benefit.new
  end

  # GET /benefits/1/edit
  def edit
  end

  # POST /benefits
  # POST /benefits.json
  def create
    @benefit = Benefit.new(benefit_params)

    respond_to do |format|
      if @benefit.save
        format.html { redirect_to @benefit, notice: 'Benefit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @benefit }
      else
        format.html { render action: 'new' }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefits/1
  # PATCH/PUT /benefits/1.json
  def update

    respond_to do |format|
      if @benefit.update(benefit_params)
        format.html { redirect_to @benefit, notice: 'Benefit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefits/1
  # DELETE /benefits/1.json
  def destroy
    @benefit.destroy
    respond_to do |format|
      format.html { redirect_to benefits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit
      @benefit = Benefit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def benefit_params
      params.require(:benefit).permit(:name, :description, :optional_amount, :max_people, :fixed_amount, :category, :program_ids => [])
    end


  def get_total_amount_granted

      return total_amount_granted
  end

end