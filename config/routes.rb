Rails.application.routes.draw do

  get "/", to: "welcome#index", as: "root"

  get "/register", to: "users#new", as: "registration"
  get "/login", to: "session#new", as: "login"

  get "/privacy", to: "privacy#show", as: "privacy"

  resources :users, only: [:new, :create]
end
