Rails.application.routes.draw do


  root to: "landingpage#show"



  resources :resume, only: [:index]
  resources :users, only: [:create]

  get '/credit_check',to: 'creditchecks#new'
  post '/credit_check', to: 'creditchecks#create'

  get '/jungle_beat', to: 'junglebeats#new'
  post '/jungle_beat', to: 'junglebeats#create'


  get '/night_writer', to: 'nightwriter#new'
  post '/night_writer', to: 'nightwriter#create'
  post '/night_reader', to: 'nightwriter#read'

  resources :contact, only: [:index]
  resources :mystory, only: [:index]
  resources :projects, only: [:index, :show]
end
