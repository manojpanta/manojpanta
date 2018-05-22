Rails.application.routes.draw do

  resources :ideas
  resources :categories
  resources :images

  root to: "pages#show"

  resources :users
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
