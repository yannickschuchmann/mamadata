class ApplicationController < ActionController::Base
	helper :all


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  prepend_before_filter authorize_resource :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_url, :notice => exception.message
  end

  def person_school_path(school)
    person_path(school.person_id, :anchor => "school")
  end

end
