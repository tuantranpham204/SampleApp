
Rails.application.routes.draw do
  # get "sessions/new"
  # get "users/new"
  root "static_pages#home"

  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/log_in", to: "sessions#new"
  delete "/log_out", to: "sessions#destroy"
  post "/log_in", to: "sessions#create"
  get "/sign_up", to: "users#new"

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check





end
