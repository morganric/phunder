Rails.application.routes.draw do
  resources :campaigns
  resources :charges
  resources :photos

  root to: 'visitors#index'

  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  # devise_for :users
  resources :users
end
