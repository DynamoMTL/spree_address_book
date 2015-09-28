Spree::Core::Engine.add_routes do
  resources :addresses, :only => [:edit, :update, :destroy] do
    member do
      put :set_default
    end
  end
end
