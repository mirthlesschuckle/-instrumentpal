Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :instruments do
    resources :reservations, only: [:new, :create, :index, :show]
  end

  resources :reservations, only: [:index, :show, :edit, :update, :destroy]

  get 'profile', to: 'pages#profile', as: "profile"
  get 'rent_instruments', to: 'pages#rent_instruments', as: "rent_instruments"
  get 'own_instruments', to: 'pages#own_instruments', as: "own_instruments"
  get 'map_instruments', to: 'pages#map_instruments', as: "map_instruments"
end
