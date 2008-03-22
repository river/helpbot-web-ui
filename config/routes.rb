ActionController::Routing::Routes.draw do |map|
  map.resources :triggers
  map.resources :channels
  map.resources :admins
  
  map.root :controller => "channels"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
