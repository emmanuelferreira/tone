Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments
  get "dashboard", to: "dashboards#summary"
end
