class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  before_filter :redirect_unless_logged_in

  private

  def redirect_unless_logged_in
    return true if current_user
    redirect_to login_path and return false
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
