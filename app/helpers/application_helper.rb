# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def navi_tab_to(name, url)
    link_to name, url, :class => (params[:controller] == name.downcase ? "current" : "background")
  end
  
  def is_global?
    @current_admin.global
  end
  
  def owns_channel(chan)
    return if !chan.is_a?(Channel)
    @current_admin.channel_ids.member?(chan.id) || @current_admin.global
  end

  def owns_trigger(trig)
    return if !trig.is_a?(Trigger)
    @current_admin.trigger_ids.member?(trig.id) || @current_admin.global
  end
  
  def submit_tag_or_cancel(name, options={})
    options = "javascript:history.go(-1)" if options.empty?
    "#{submit_tag(name)} or #{link_to 'Cancel', options, :class => 'cancel'}"
  end
  
  def logged_in? 
    @current_admin.is_a?(Admin) 
  end
end
