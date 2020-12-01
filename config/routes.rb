Rails.application.routes.draw do
  resources :authors
  resources :movies
  
  root 'movies#index'
end
