Rails.application.routes.draw do
  
  namespace :admin do
      resources :users
      resources :carts
      resources :cart_items
      resources :items
      resources :orders
      resources :order_items

      root to: "users#index"
    end
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  root 'items#index'
  resources :items
  resources :carts, only: [:create, :update, :destroy, :show]
  resources :orders, only: [:new, :create, :destroy, :show]
  get 'static_pages/contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
