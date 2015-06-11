Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :carousels, path: "carousels" do
      resources :slides, path: "slides" do
        collection do
          patch :sort
        end
      end
    end
  end
end
