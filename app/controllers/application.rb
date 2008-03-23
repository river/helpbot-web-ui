# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all # everything is a helper, I say!

  before_filter :initialize_user # setup user info on each page

  def owns_channel(chan)
    if logged_in?
      @current_admin.channel_ids.member?(chan.id) || @current_admin.global
    else
      return false
    end
  end

  def owns_trigger(trig)
    if logged_in?
      @current_admin.trigger_ids.member?(trig.id) || @current_admin.global
    else
      return false
    end
  end
  
  def initialize_user 
    @current_admin = Admin.find_by_id(session[:admin]) if session[:admin] 
  end
  
  def logged_in? 
    @current_admin.is_a?(Admin) 
  end
end
