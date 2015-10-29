Rails.application.routes.draw do

  resources :users
  resources :posts

  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  delete 'logout' => "sessions#destroy"



  # You can have the root of your site routed with "root"
  root 'home#index'

  
end
