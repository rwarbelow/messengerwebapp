Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  resources :chatrooms, only: [:index, :show, :new, :create, :destroy]
  post '/messages', to: 'messages#create'
  root to: 'chatrooms#index'
  mount ActionCable.server => '/cable'
end
