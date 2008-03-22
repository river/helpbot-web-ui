ActionController::Routing::Routes.draw do |map|
  map.resources :triggers
  map.resources :channels
  map.resources :admins
  
  map.destroy_admin "admins/destroy/:id", :controller => "admins", :action => "destroy"
  
  map.root :controller => "channels"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
