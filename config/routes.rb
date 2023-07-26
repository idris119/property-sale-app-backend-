Rails.application.routes.draw do
  resources :houses
  resources :users
  resources :vehicles
  resources :lands, only: [:index, :show, :create, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post "/login", to:"session#login"
  delete "/logout", to:"session#logout"
  get "/current_user", to:"users#loggedin_user"

end
