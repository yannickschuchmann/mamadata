class ApplicationController < ActionController::Base
	helper :all
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def person_school_path(school)
    person_path(school.person_id, :anchor => "school")
  end

  def is_admin?
  	if current_user.role == "admin"
  		return true
  	else
  		flash[:notice] = 'You must be an admin to access this Page.'
  		return false
  	end
  end

  def is_editor?
  	if current_user.role == "editor"
  		return true
  	else
  		flash[:notice] =  'You have not the right to access this Page. You need admin rights.'
  		redirect_to :root
  		return false
   	end
  end

  def is_supporter?
  	if current_user.role == "supporter"
  		return true
  	else
  		flash[:notice] =  'You have not the right to access this Page. You need at least editor rights.'
  		redirect_to :root
  		return false
   	end
  end

end
