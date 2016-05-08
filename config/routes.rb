Rails.application.routes.draw do
  root "homes#show"

  get "/homes/:id"  to: "homes#show"
  get "/coders/:id", to: "coders#show", as: :coder
  get "/coders", to: "coder#index", as: :coders
  get "/users/new", to: "users#new", as: :new_user
  post "/users", to: "users#create", as: :users
  post "/contracts", to: "contracts#create", as: :contracts
  get "/contract/:id", to: "contracts#show", as: :contract
  get "/teams", to: "teams#index", as: :teams
  post "/teams", to: "teams#create"
  delete "/teams/:id", to: "teams#destroy", as: :team

  get "/admin/dashboard", to: "admin/users#show", as: :admin_dashboard
  get "/admin/users/:id/edit", to: "admin/users#edit", as: :edit_admin_user
  patch "/admin/users/:id", to: "admin/users#update", as: :admin_user

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/dashboard", to: "users#show", as: :dashboard
  get "/history", to: "contracts#index"
  get "/:slug", to: "categories#show", as: :category
end


