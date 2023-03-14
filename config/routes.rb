Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :instruments do
    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show, :edit, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
