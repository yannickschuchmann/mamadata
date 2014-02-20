class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy, :terminate]

  # GET people/:id/schools/new
  def new
    @school = School.new(person_id: params[:id], joined_at: Time.now)
  end

  def create
    @school = School.new(school_params)
    respond_to do |format|
      if @school.save
        format.html { redirect_to person_school_path(@school), notice: 'school has been successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def index
    @schools = School.all.order(created_at: :desc)
  end

  def edit
  end

  def destroy
    old_school = @school
    @school.destroy
    respond_to do |format|
      format.html { redirect_to person_school_path(old_school) }
      format.json { head :no_content }
    end
  end

  def terminate
  end

  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to person_school_path(@school), notice: 'School has been successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def show
  end

  private

  def set_school
    @school = School.find(params[:id])
  end

  def school_params
    params.require(:school).permit(:person_id, :name, :type, :joined_at, :language, :remark, :termination_reason, :terminated_at, :termination_remark)
  end
end
