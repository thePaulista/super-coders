Rails.application.routes.draw do
  root "homes#show"
  resources :homes, only: [:show]


  resources :users, only: [:new, :create]
  resources :coders, only: [:index, :show]
  resources :teams, only: [:create, :index, :destroy]
  resources :contracts, only: [:create, :show]


  namespace :admin do
    resources :users, only: [:edit, :update]
    get "/dashboard", to: "users#show", as: :dashboard
  end


  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show", as: :dashboard
  get "/history", to: "contracts#index"


  get "/:slug", to: "categories#show", as: :category
end
