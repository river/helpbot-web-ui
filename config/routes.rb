ActionController::Routing::Routes.draw do |map|
  map.root :controller => "channels"
  
  # Naming the Admin Routes
  map.admins          "admins",               :controller => "admins"
  map.signup          "signup",               :controller => "admins",   :action => "new"
  map.edit_admin      "admins/edit/:id",      :controller => "admins",   :action => "edit"
  map.admin           "admins/show/:id",      :controller => "admins",   :action => "show"
  map.destroy_admin   "admins/destroy/:id",   :controller => "admins",   :action => "destroy"
  
  # Naming the Channel Routes
  map.channels        "channels",             :controller => "channels"
  map.new_channel     "channels/new",         :controller => "channels", :action => "new"
  map.edit_channel    "channels/edit/:id",    :controller => "channels", :action => "edit"
  map.channel         "channels/show/:id",    :controller => "channels", :action => "show"
  map.destroy_channel "channels/destroy/:id", :controller => "channels", :action => "destroy"
  
  # Naming the Session Routes
  map.login           "login",                :controller => "sessions", :action => "new"
  
  # Naming the Triggers Routes
  map.edit_trigger    "triggers/edit/:id",    :controller => "triggers", :action => "edit"
  map.trigger         "triggers/show/:id",    :controller => "triggers", :action => "show"
  map.destroy_trigger "triggers/destroy/:id", :controller => "triggers", :action => "destroy"
  
  # Default Routes
  map.connect         ':controller/:action/:id'
  map.connect         ':controller/:action/:id.:format'
end
