Rails.application.routes.draw do
  root 'pages#front'
  get '/home', to: 'pages#home'
  resources :tweets, only: [:create]
  resources :users, only: [:create, :show]
  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end
