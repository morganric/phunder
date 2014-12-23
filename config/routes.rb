Rails.application.routes.draw do
  resources :profiles

  resources :campaigns
  resources :charges
  resources :photos

  post 'pages/about' => 'high_voltage/pages#show', id: 'about'
  get "/tagged/:id" => "campaigns#tag", :as => :tagged_posts

  devise_for :users,  :controllers => { :omniauth_callbacks => "users/omniauth_callbacks"}
  # devise_for :users
  resources :users

  get 'users/sign_out' => 'users/sessions#destroy'

  devise_scope :user do
	  get "users/sign_in", :to => "devise/sessions#new"
	  get 'users/sign_out', :to => 'devise/sessions#destroy'
	end

  get "/campaigns/:slug/photos/:id" => "photos#show", as: "campaign_photo"

  root to: 'visitors#index'
  
end
