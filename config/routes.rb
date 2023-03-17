Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :instruments do
    resources :reservations, only: [:new, :create, :index, :show]
  end

  resources :reservations, only: [:index, :show, :edit, :update, :destroy]

  # get 'update_status', to: 'reservations#update_status', as: 'update_status'
  patch 'reservations/:id/update_status', to: 'reservations#update_status', as: 'update_status'
end
