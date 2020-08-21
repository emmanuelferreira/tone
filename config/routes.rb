Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :instruments do
    resources :bookings, only: [:new, :create ]
  end
  resources :bookings, only: [:show, :destroy, :edit, :update ] do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :reviews, only: [ :show, :destroy ]
  get "dashboard", to: "dashboards#summary"
  get "profile", to: "profiles#overview"
end
