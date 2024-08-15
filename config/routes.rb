Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:new, :create, :edit, :update]
  resources :listings, except: [:show, :index, :edit, :update] do
    resources :rentals, only: [:create]
  end
  resources :games, only: [:index, :show]
  resources :rentals, only: [:index, :update, :destroy]
end
