#Questions
#1. How do I construct proper password confirmation and validation?
#2. How to create proper views/errors for when a signup field is left blank or a password is incorrect

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :page
  helper_method :navigation

  def current_user
    if session[:user_id]
      User.find_by(id: session[:user_id]) rescue nil
    end
  end

  def login_required
    unless current_user
      flash[:error] = "You must be logged in to do that!"
      session[:redirect] = request.url
      redirect_to login_path
    end
  end

  def page
    @page || ''
  end

  def navigation
    @navigation || 'layouts/navigation'
  end
  

end
