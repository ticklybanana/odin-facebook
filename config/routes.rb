Rails.application.routes.draw do
  devise_for :users
  resources :registrations, only: :show
  resources :posts
  resources :likes, only: :create
  
  root 'posts#index'
end
