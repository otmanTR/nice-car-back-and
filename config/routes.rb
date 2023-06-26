Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create] 
      post 'users/login', to: 'users#login'
      resources :reservations, only: [:index, :create, :destroy]
      resources :cars, only: [:index, :create, :destroy]
    end
  end
end
