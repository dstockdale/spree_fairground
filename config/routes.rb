Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :parliaments, path: "carousels" do
      resources :owls, path: "slides" do
        
      end
    end
  end
end
