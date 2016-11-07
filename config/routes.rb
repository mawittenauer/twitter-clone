Rails.application.routes.draw do
  root 'pages#front'
  get '/home', to: 'pages#home'
  resources :tweets, only: [:create]
  resources :users, only: [:create, :show, :index] do
    resources :relationships, only: [:create]
    member do
      delete '/relationships', to: 'relationships#destroy'
    end
  end
  get '/register', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end
