Rails.application.routes.draw do
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/destroy'
  devise_for :users
  root to: 'pages#home'
  resources :instruments do
    resources :bookings, only: [:new, :create ]
  end
  resources :bookings, only: [:show, :destroy ]
end
