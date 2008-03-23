# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all

  before_filter :initialize_user 
  
  # make these available as ActionView helper methods.  

  protected 
 
  # Check if the user is already logged in 
  def logged_in? 
    @current_admin.is_a?(Admin) 
  end
  
  def owns_channel(chan)
    @current_admin.channel_ids.member?(chan.id)
  end
  
  def owns_trigger(trig)
    @current_admin.trigger_ids.member?(trig.id)
  end

  # setup user info on each page 
  def initialize_user 
    @current_admin = Admin.find_by_id(session[:admin]) if session[:admin] 
  end
end
