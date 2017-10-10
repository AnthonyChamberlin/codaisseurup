Rails.application.routes.draw do
  resources :categories
  root 'pages#home'
  devise_for :users

  resources :users, only: [:show]
  resources :events, except: [:destroy]
end
