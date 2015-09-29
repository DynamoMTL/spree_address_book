Spree::Core::Engine.add_routes do
  resources :addresses

  namespace :api, defaults: { format: 'json' } do
    resources :address_book do
      member do
        put :set_default
      end
    end
  end
end
