class JournalsController < ApplicationController
def create
    @person = Person.find(params[:person_id])
    @journal = @person.journals.create(params[:journal].permit(:text, :date))
    redirect_to person_path(@person)
  end 
  def destroy
    @person = Person.find(params[:person_id])
    @journal = @post.journals.find(params[:id])
    @journal.destroy
    redirect_to journal_path(@post)
  end
end
