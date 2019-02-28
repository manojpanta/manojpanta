Rails.application.routes.draw do


  root to: "landingpage#show"



  resources :resume, only: [:index]
  resources :users, only: [:create]
  resources :games
  post '/games/new', to: 'games#create'
  resources :contact, only: [:index]
  resources :mystory, only: [:index]
  resources :projects, only: [:index, :show]
end
