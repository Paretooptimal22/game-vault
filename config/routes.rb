Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:new, :create, :edit, :update]

  resources :listings, except: [:edit, :update] do
    member do
      patch 'update_status'
      delete 'destroy'
    end
    resources :rentals, only: [:create]  # Nested rentals routes within a listing
  end

  resources :rentals, only: [:index, :update, :destroy]  # Manage rentals independently
end
