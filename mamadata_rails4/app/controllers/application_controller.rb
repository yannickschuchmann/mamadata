class ApplicationController < ActionController::Base
	helper :all
  before_filter :set_current_user


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  prepend_before_filter authorize_resource :unless => :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    if current_user and current_user.role == "sharana_france" #warning string specifies role at the moment
      redirect_to supporters_url, :notice => exception.message
    else
      redirect_to new_user_session_url, :notice => exception.message
    end
  end

  def person_school_path(school)
    person_path(school.person_id, :anchor => "school")
  end

  def set_current_user
    User.current = current_user
  end

end
