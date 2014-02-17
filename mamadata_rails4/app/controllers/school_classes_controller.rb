class SchoolClassesController < ApplicationController
  def new
    @school_class = SchoolClass.new(school_id: params[:school_id])
  end

  def create
    @school_class = SchoolClass.create(school_class_params)
    @school = School.find(@school_class.school_id)
    @person = Person.find(@school.person_id)
    respond_to do |format|
      if @school_class.save
        format.html { redirect_to @person, notice: 'School Class has been successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def school_class_params
    params.require(:school_class).permit(:school_id, :name, :document, :remark)
  end
end
