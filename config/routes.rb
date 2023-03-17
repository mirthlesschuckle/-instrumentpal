Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :instruments do
    resources :reservations, only: [:new, :create, :index, :show]
  end

  resources :reservations, only: [:index, :show, :edit, :update, :destroy]

  # get 'update_status', to: 'reservations#update_status', as: 'update_status'
  patch 'reservations/:id/update_status', to: 'reservations#update_status', as: 'update_status'

  get 'profile', to: 'pages#profile', as: "profile"
  get 'rent_instruments', to: 'pages#rent_instruments', as: "rent_instruments"
  get 'own_instruments', to: 'pages#own_instruments', as: "own_instruments"
  get 'map_instruments', to: 'pages#map_instruments', as: "map_instruments"
  get 'story', to: 'pages#story', as: "story"
end
