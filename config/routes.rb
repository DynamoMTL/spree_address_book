Spree::Core::Engine.add_routes do
  resources :addresses, :only => [:edit, :update, :destroy]
end
