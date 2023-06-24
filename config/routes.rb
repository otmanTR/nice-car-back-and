Rails.application.routes.draw do
  resources :users
  # post "/signup", to: "users#create"
  # post "/login", to: "sessions#create"
  # get "/authorized", to: "sessions#show"
  # get "/dashboard", to: "users#show"
  # post 'login', to: 'sessions#create'
  # delete 'logout', to: 'sessions#destroy'
  # get 'login', to: 'sessions#new'
  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy]
      resources :cars, only: [:index, :create, :destroy]
    end
  end
end
