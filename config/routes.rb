Rails.application.routes.draw do

  get "/", to: "welcome#index", as: "root"

  get "/register", to: "users#new", as: "registration"
  
  # get "/login", to: "session#new", as: "login"
  get 'login', to: "sessions#new", as: 'login'

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')


  get "/privacy", to: "privacy#show", as: "privacy"

  resources :users, only: [:new, :create]
end
