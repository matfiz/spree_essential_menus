Spree::Core::Engine.routes.prepend do
    namespace :admin do
      resources :menus
      resources :menu_bars
    end
end