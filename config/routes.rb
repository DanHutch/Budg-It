Rails.application.routes.draw do

  get "/", to: "welcome#index", as: "root"

  get "/register", to: "users#new", as: "registration"

  get '/oauth', to: redirect('/auth/ynab'), as: 'oauth'

  get 'login', to: "sessions#new", as: 'login'
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: "users#show", as: "dashboard"

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')


  get "/privacy", to: "privacy#show", as: "privacy"

  resources :users, only: [:new, :create]

  # namespace :users do
  #   put "/categories", to: "categories#update", as: "category_update"
  # end

  put "/categories", to: "categories#update", as: "categories"
end
