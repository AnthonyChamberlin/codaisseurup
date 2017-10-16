Rails.application.routes.draw do
  resources :categories
  root 'pages#home'
  devise_for :users

  resources :users, only: [:show]
  resources :events, except: [:destroy]
  resources :profiles, only: [:new, :edit, :create, :update]

  namespace :api do   # /api/..
    resources :events # ../events/..
  end

end
