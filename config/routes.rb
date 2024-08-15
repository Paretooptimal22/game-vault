Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:new, :create, :edit, :update]
  resources :listings, except: [:edit, :update] do
    resources :rentals, only: [:create]
  end

  resources :rentals, only: [:index, :update, :destroy]

  resources :games, only: [:index]
end
