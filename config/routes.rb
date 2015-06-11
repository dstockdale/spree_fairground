Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :parliaments, path: "carousels" do
      resources :owls, path: "slides" do
        collection do
          patch :sort
        end
      end
    end
  end
end
