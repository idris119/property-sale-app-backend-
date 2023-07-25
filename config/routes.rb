Rails.application.routes.draw do
  resources :users
  resources :vehicles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" # GET /lands
  # Get all lands
  get '/lands', to: 'lands#index'

  # GET /lands/:id
  # Get a specific land by ID
  get '/lands/:id', to: 'lands#show'

  # POST /lands
  # Create a new land entry
  post '/lands', to: 'lands#create'

  # PATCH/PUT /lands/:id
  # Update a specific land by ID
  put '/lands/:id', to: 'lands#update'

  # DELETE /lands/:id
  # Delete a specific land by ID
  delete '/lands/:id', to: 'lands#destroy'
end
