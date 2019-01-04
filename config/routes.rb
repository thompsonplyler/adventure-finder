Rails.application.routes.draw do
  resources :users
  resources :characters
  resources :campaigns
  get '/characters/:id/campaigns', to: 'characters#adventure', as: 'character_campaign'
  get 'login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :requests
  get '/users/:id/requests', to: 'users#requests', as: "user_requests"
  patch '/users/:id/requests', to: 'requests#update', as: 'update_request'
  post '/users/:id/requests', to: 'requests#destroy', as: 'destroy_request'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
