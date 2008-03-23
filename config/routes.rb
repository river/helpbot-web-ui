ActionController::Routing::Routes.draw do |map|
  map.resources :channels
  map.resources :admins
  
  map.destroy_admin "admins/destroy/:id", :controller => "admins", :action => "destroy"
  map.login "login", :controller => "sessions", :action => "new"
  map.signup "signup", :controller => "admins", :action => "new"
  
  map.root :controller => "channels"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
