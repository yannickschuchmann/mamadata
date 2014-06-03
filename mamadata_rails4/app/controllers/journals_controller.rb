class JournalsController < ApplicationController
	def create
		@person = Person.find(params[:person_id])
		@journal = @person.journals.create(params[:journal].permit(:text))
		redirect_to person_path(@person)+"#panel2-5"
	end
	def destroy
		@person = Person.find(params[:person_id])
		@journal = @person.journals.find(params[:id])
		@journal.destroy
		redirect_to person_path(@person)+"#panel2-5"
	end
end
