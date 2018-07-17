class ApplicationController < ActionController::Base
  # Make the current_user method available to views also, not just controllers:
  helper_method :current_user
  
  # Define the current_user method:
  def current_user
    # Look up the current user based on user_id in the session cookie:
    # ||= part ensures this helper doesn't hit the database every time a user hits a web page. 
    # It will look it up once, then cache it in the @current_user variable
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # authroize method redirects user to login page if not logged in:
  def authorize
  	redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end

end
