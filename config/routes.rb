Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :carousels do
      resources :slides do
        collection do
          patch :sort
        end
      end
    end
  end
end
