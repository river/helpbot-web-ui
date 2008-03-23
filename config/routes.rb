ActionController::Routing::Routes.draw do |map|
  #map.resources :triggers
  map.resources :admins
  map.resources :channels
  
  # TODO: get rid of map.resources :triggers and add some more named routes for triggers
  map.trigger	'channels/:channel_id/triggers/:action/:id',
  				:controller => "triggers",
  				:action		=> "show",
  				:channel_id	=> /\d+/
  
  map.destroy_admin "admins/destroy/:id", :controller => "admins", :action => "destroy"
  map.login "login", :controller => "sessions", :action => "new"
  map.signup "signup", :controller => "admins", :action => "new"
  
  map.root :controller => "channels"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
