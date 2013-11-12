class BenFamilyMembersController < ApplicationController
  before_action :set_ben_family_member, only: [:show, :edit, :update, :destroy]

  # GET /ben_family_members
  # GET /ben_family_members.json
  def index
    @ben_family_members = BenFamilyMember.all
  end

  # GET /ben_family_members/1
  # GET /ben_family_members/1.json
  def show
  end

  # GET /ben_family_members/new
  def new
    @ben_family_member = BenFamilyMember.new
  end

  # GET /ben_family_members/1/edit
  def edit
  end

  # POST /ben_family_members
  # POST /ben_family_members.json
  def create
    @ben_family_member = BenFamilyMember.new(ben_family_member_params)

    respond_to do |format|
      if @ben_family_member.save
        format.html { redirect_to @ben_family_member, notice: 'Ben family member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ben_family_member }
      else
        format.html { render action: 'new' }
        format.json { render json: @ben_family_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ben_family_members/1
  # PATCH/PUT /ben_family_members/1.json
  def update
    respond_to do |format|
      if @ben_family_member.update(ben_family_member_params)
        format.html { redirect_to @ben_family_member, notice: 'Ben family member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ben_family_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ben_family_members/1
  # DELETE /ben_family_members/1.json
  def destroy
    @ben_family_member.destroy
    respond_to do |format|
      format.html { redirect_to ben_family_members_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ben_family_member
      @ben_family_member = BenFamilyMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ben_family_member_params
      params.require(:ben_family_member).permit(:beneficiary, :relation, :status, :name, :surname, :date_of_birth, :profession, :income)
    end
end
