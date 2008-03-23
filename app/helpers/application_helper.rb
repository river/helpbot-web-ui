# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def navi_tab_to(name, url)
    link_to name, url, :class => (params[:controller] == name.downcase ? "current" : "background")
  end
  
  def is_global?
    @current_admin.global
  end
  
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
  
  def submit_tag_or_cancel(name, options={})
    options = "javascript:history.go(-1)" if options.empty?
    "#{submit_tag(name)} or #{link_to 'Cancel', options, :class => 'cancel'}"
  end
  
  # TODO: logged_in?, owns_channel, and owns_trigger are also in ApplicationController. Please D.R.Y. this up.
  
  def logged_in? 
    @current_admin.is_a?(Admin) 
  end
end
