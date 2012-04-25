Spree::Core::Engine.routes.prepend do
    namespace :admin do
      resources :menus
    end
end