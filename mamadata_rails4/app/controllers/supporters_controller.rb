class SupportersController < ApplicationController
  before_action :set_supporter, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  # GET /supporters
  # GET /supporters.json
  def index
    @supporters = Supporter.all.order(created_at: :desc)
  end

  # GET /supporters/1
  # GET /supporters/1.json
  def show
  end

  # GET /supporters/new
  def new
    @supporter = Supporter.new
  end

  # GET /supporters/1/edit
  def edit
  end

  # POST /supporters
  # POST /supporters.json
  def create
    @supporter = Supporter.new(supporter_params)
    # puts "@@@@@"
    # puts params[:donor_type].blank?
    # puts "@@@@@@@"
    # @supporter.build_donor_type(params[:donor_type])
    respond_to do |format|
      if @supporter.save
        format.html { redirect_to @supporter, notice: 'Supporter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @supporter }
      else
        format.html { render action: 'new' }
        format.json { render json: @supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supporters/1
  # PATCH/PUT /supporters/1.json
  def update
    respond_to do |format|
      if @supporter.update(supporter_params)
        format.html { redirect_to @supporter, notice: 'Supporter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supporter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supporters/1
  # DELETE /supporters/1.json
  def destroy
    @supporter.destroy
    respond_to do |format|
      format.html { redirect_to supporters_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supporter
      @supporter = Supporter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supporter_params
      params.require(:supporter).permit(:organisation,:name , :family_name, :date_of_birth, :country, :city, :street, :zipcode, :email, :website, :telephone_number, :godfather, :is_volunteer, :begin_of_work, :end_of_work, :type_of_work, :donor_type_id, :is_donor, :donation_amount, :donation_year, :street_number,:avatar, :avatar_file_name)
    end
end
