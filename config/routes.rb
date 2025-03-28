Rails.application.routes.draw do
  # Root route
  root 'posts#index'

  # User authentication routes
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # RESTful resources
  resources :users do
    resource :profile, only: [:show, :edit, :update]
  end

  resources :posts do
    resources :comments, except: [:index, :show]
  end

  resources :categories
end