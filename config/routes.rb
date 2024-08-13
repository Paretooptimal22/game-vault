Rails.application.routes.draw do
  devise_for :users
  root to: "lists#index"

  resources :users, only: [:new, :create, :edit, :update]
  resources :listings, except: [:edit, :update] do
    resources :rentals, only: [:create]
  end

  resources :rentals, only: [:update, :destroy]
end
