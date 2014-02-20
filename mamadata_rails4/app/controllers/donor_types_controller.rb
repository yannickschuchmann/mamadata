class DonorTypesController < ApplicationController
  before_action :set_supporter, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def create
    @donor_type = DonorType.new(donor_type_params)
    respond_to do |format|
      if @donor_type.save
        format.html { redirect_to donor_types_path, notice: 'Success.' }
        format.json { render :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @donor_type.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @donor_type.update(donor_type_params)
        format.html { redirect_to donor_types_path, notice: 'Successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @donor_type.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @donor_type = DonorType.find(params[:id])
  end

  def new
    @donor_type = DonorType.new
  end

  def destroy
    @donor_type.destroy
    respond_to do |format|
       format.html { redirect_to donor_types_path, notice: 'Success' }
       format.json { head :no_content }
    end
  end

  def index
    @donor_types = DonorType.all
  end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor_type
      @donor_type = DonorType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def donor_type_params
      params.require(:donor_type).permit(:name)
    end
end
