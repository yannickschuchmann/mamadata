class PersonGodfatherFilesController < ApplicationController
	

	def new
		@person_godfather_file = PersonGodfatherFile.new(godfather_person_id: params[:id])
	end


def create
  @person_godfather_file = PersonGodfatherFile.create( person_godfather_file_params )
   respond_to do |format|
      if @person_godfather_file.save
        format.html { redirect_to root_path, notice: 'File upload successfull' }
      end
    end
end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def person_godfather_file_params
  params.require(:person_godfather_file).permit(:file, :godfather_person_id)
end
end
