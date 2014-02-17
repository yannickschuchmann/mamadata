class SchoolsController < ApplicationController
  # GET people/:id/schools/new
  def new
    @school = School.new(person_id: params[:id])
  end

  def create
    @school = School.new(school_params)
    respond_to do |format|
      if @school.save
        @person = Person.find(@school.person_id)
        format.html { redirect_to @person, notice: 'school has been successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def index
    @schools = School.all
  end

  private

  def school_params
    params.require(:school).permit(:person_id, :name, :type, :language, :remark)
  end
end
