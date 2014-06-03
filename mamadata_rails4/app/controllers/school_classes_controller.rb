class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :edit, :update, :destroy, :document]
  def new
    @school_class = SchoolClass.new(school_id: params[:school_id])
  end

  def create
    @school_class = SchoolClass.create(school_class_params)
    respond_to do |format|
      if @school_class.save
        format.html { redirect_to person_school_path(@school_class.school), notice: 'School Class has been successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def document
    send_file @school_class.document.path, :type => @school_class.document_content_type
  end

  def destroy
    school = @school_class.school
    @school_class.destroy
    respond_to do |format|
      format.html { redirect_to person_school_path(school) }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @school_class.update(school_class_params)
        format.html { redirect_to person_school_path(@school_class.school), notice: 'School has been successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  private
  def set_school_class
    @school_class = SchoolClass.find(params[:id])
  end

  def school_class_params
    params.require(:school_class).permit(:school_id, :name, :document, :remark)
  end

end
