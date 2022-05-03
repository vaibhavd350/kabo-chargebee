Rails.application.routes.draw do
  root 'home#index'
  get 'home/chargebee_data'
  devise_for :users

  resources :users, only: [:index] do 
    resources :user_subscriptions, only: [:index, :edit, :update]
  end

  resources :user_subscriptions, only: [] do 
    resources :user_subscription_items, only: [:index] 
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
