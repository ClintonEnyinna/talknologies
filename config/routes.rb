Rails.application.routes.draw do
  root 'opinions#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  resources :users
  resources :opinions
  resources :friendships
end
