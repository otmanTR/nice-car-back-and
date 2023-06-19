Rails.application.routes.draw do
  
  resources :users  

  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy]
      resources :cars, only: [:index, :create, :destroy]
    end
  end
end
