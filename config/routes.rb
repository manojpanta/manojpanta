Rails.application.routes.draw do

  resources :categories
  resources :images

  root to: "pages#show"


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users do
    resources :ideas
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
