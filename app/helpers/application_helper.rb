# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def navi_tab_to(name, url)
    link_to name, url, :class => (params[:controller] == name.downcase ? "current" : "background")
  end
  
  def is_global?
    @current_admin.global
  end
end
