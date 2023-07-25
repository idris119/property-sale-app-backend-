Rails.application.routes.draw do
  resources :houses
  resources :users
  resources :vehicles
  resources :lands, only: [:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
