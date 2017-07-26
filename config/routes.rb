Rails.application.routes.draw do
  root 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  devise_for :users
  resources :organizations, only: [:new, :create, :show]
end
