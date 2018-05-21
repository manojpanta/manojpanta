Rails.application.routes.draw do

  resources :ideas
  resources :categories

  root to: "pages#show"

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
