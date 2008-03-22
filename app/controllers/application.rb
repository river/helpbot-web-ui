# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery 

  before_filter :initialize_user 
  
  # make these available as ActionView helper methods. 
  helper_method :logged_in? 

  protected 
 
  # Check if the user is already logged in 
  def logged_in? 
    @current_admin.is_a?(Admin) 
  end 

  # setup user info on each page 
  def initialize_user 
    @current_admin = Admin.find_by_id(session[:admin]) if session[:admin] 
  end
end
