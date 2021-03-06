Rails.application.routes.draw do
  resources :cates

  resources :items do
    member do
      get :add_cart
    end
  end

  devise_for :managers
  devise_for :users
  resources :statics , :only => [:index]
  root "items#index"
  resources :items , :only => [:index , :show]
  namespace :dashboard do
    resources :orders
    namespace :admin do
	     resources :items
       resources :cates
       resources :orders

       resources :users
       resources :managers
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
