Rails.application.routes.draw do
  devise_for :users
  resources :authors
  resources :movies
  
  root 'movies#index'
end
