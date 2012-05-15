Spree::Core::Engine.routes.draw do

  root :controller => "boxes", :action => "index"

  namespace :admin do
    resources :box_locations do
      collection do
        post :reorder
      end
    end
    resources :boxes do
      collection do
        post :reorder
      end
    end
  end

end
