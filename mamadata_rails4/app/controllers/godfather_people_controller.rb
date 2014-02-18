class PersonGodfatherFilesController < ApplicationController
def create
  @person_godfather_file = PersonGodfatherFile.create( person_godfather_file_params )
   respond_to do |format|
      if @person_godfather_file.save
        format.html { redirect_to root_path, notice: 'Benefit incident was successfully created.' }
      end
    end
end

private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

def person_godfather_file_params
  params.require(:person_godfather_file).permit(:file)
end
end
