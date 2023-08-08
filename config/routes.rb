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
  patch "/houses/approve/:id", to:"houses#approve"
  patch "/lands/approve/:id", to:"lands#approve"
  patch "/vehicles/approve/:id", to:"vehicles#approve"
  get "/approvedhouses", to:"houses#approvedhouses"
  get "/approvedlands", to:"lands#approvedlands"
  get "/approvedvehicles", to:"vehicles#approvedvehicles"
  get "/vehiclesneedingapproval", to: "vehicles#vehiclesneedingapproval"
  get "/housesneedingapproval", to: "houses#housesneedingapproval"
  get "/landsneedingapproval", to: "lands#landsneedingapproval"
  #Search Component Routes
  get 'search/houses', to: 'houses#search'
  get 'search/vehicles', to: 'vehicles#search'
  get 'search/land', to: 'land#search'
  get '/search', to: 'application#search'




end