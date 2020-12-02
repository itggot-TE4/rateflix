Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  resources :authors
  resources :movies
  
  root 'movies#index'
end
