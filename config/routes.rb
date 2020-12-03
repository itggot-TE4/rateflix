Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :reviews
      resources :authors
      resources :movies
    end
  end

  devise_for :users
  root 'movies#index'
end
