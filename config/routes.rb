Rails.application.routes.draw do
  root to: "tweets#index"
  resources :tweets
  resources :users, only: %i[new create destroy]
  resources :comments

  get "/login", to: "sessions#new"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"
  get "/profile", to: "users#edit"
  post "/profile", to: "users#create"
  patch "/profile", to: "users#update"
  put "/profile", to: "users#update"
  delete "/profile", to: "users#destroy"
end
