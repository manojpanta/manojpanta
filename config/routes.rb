Rails.application.routes.draw do


  root to: "pages#show"


  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :show] do
    resources :ideas
  end

  namespace :admin do
    resources :categories, except: [:index]
    resources :images, except: [:show, :index]
  end

  resources :categories, only: [:index]
  resources :images, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
