class PersonGodfatherFilesController < ApplicationController
  before_action :set_person_godfather_file, only: [:show, :edit, :update, :destroy, :getfile]

  def getfile
    send_file @person_godfather_file.file.path, :type => @person_godfather_file.file_content_type
  end

  def new
    @person_godfather_file = PersonGodfatherFile.new(godfather_person_id: params[:id])
  end


  def create
    @person_godfather_file = PersonGodfatherFile.create( person_godfather_file_params )
    @gfi = @person_godfather_file.godfather_person_id
    @person_id = GodfatherPerson.with_deleted.find(@gfi).person_id
    puts @person_id
    respond_to do |format|
      if @person_godfather_file.save
        format.html { redirect_to person_path(@person_id),
           notice: 'File successfully uploaded' }
        else
          format.html { redirect_to person_path(@person_id),
             notice: 'Something went wrong' }
          end
        end
      end

      private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def person_godfather_file_params
  params.require(:person_godfather_file).permit(:file, :godfather_person_id, :remark)
end

def set_person_godfather_file
  @person_godfather_file = PersonGodfatherFile.find(params[:id])
end
end