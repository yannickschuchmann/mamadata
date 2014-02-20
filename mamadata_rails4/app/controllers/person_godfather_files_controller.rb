class PersonGodfatherFilesController < ApplicationController
  before_action :set_person_godfather_file, only: [:show, :edit, :update, :destroy, :getfile]
  before_filter :authenticate_user!

  def getfile
    send_file @person_godfather_file.file.path, :type => @person_godfather_file.file_content_type
  end

  def new
    @person_godfather_file = PersonGodfatherFile.new(godfather_person_id: params[:id])
  end

  def destroy
      get_person_id
    @person_godfather_file.destroy
      respond_to do |format|
      format.html { redirect_to person_path(@person_id), notice: 'File deleted succesfully' }
      format.json { head :no_content }
    end
  end


  def create
      remark_params = params[:remark]
      type_of_corresp = remark_params[:typeof]
      language = remark_params[:language]
      day = remark_params["submitdate(3i)"]
      month = remark_params["submitdate(2i)"]
      year = remark_params["submitdate(1i)"]

      remark_to_safe = type_of_corresp+"/"+language+"/"+day+"-"+month+"-"+year

    @person_godfather_file = PersonGodfatherFile.create( person_godfather_file_params )
    @person_godfather_file.remark = remark_to_safe
    get_person_id
    respond_to do |format|
      if @person_godfather_file.save
        format.html { redirect_to person_path(@person_id),
           notice: 'File successfully uploaded' }
        else

        format.html { render action: 'new' }
        format.json { render json: @person_godfather_file.errors, status: :unprocessable_entity }
          end
        end
      end

      private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def set_person_godfather_file
  @person_godfather_file = PersonGodfatherFile.find(params[:id])
end

def person_godfather_file_params
  params.require(:person_godfather_file).permit(:file, :godfather_person_id, :remark)
end
# 
def get_person_id
    
    @gfi = @person_godfather_file.godfather_person_id
    @person_id = GodfatherPerson.with_deleted.find(@gfi).person_id
end

end
