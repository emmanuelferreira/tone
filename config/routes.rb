Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments do
    resources :bookings, only: [:new, :create ]
    resources :reviews, only: [:index, :new, :create]
  end
  resources :bookings, only: [:show, :destroy ]
  resources :reviews, only: [ :show, :destroy ]
  get "dashboard", to: "dashboards#summary"
  get "profile", to: "profiles#overview"
end
