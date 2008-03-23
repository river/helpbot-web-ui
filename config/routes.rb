ActionController::Routing::Routes.draw do |map|
  #map.resources :triggers
  map.resources :admins
  map.resources :channels
  
  map.edit_trigger "channels/:channel_id/triggers/edit/:id", :controller => "triggers", :action => "edit"
  map.destroy_trigger "channels/:channel_id/triggers/destroy/:id", :controller => "triggers", :action => "destroy"
  map.connect	'channels/:channel_id/triggers/:action/:id',
  				    :controller => "triggers",
  				    :channel_id	=> /\d+/
  
  map.destroy_channel "channels/destroy/:id", :controller => "channels", :action => "destroy"
  
  map.destroy_admin "admins/destroy/:id", :controller => "admins", :action => "destroy"
  map.login "login", :controller => "sessions", :action => "new"
  map.signup "signup", :controller => "admins", :action => "new"
  
  map.root :controller => "channels"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
