Rails.application.routes.draw do
  root to: "splash#index"

  get "/splash", to: "splash#index"
  get "/splash/about", to: "splash#about", as: "about"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/edit", to: "users#edit", as: "edit_user_profile"
  patch "/users/:id", to: "users#update"

  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"

  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new", as: "new_post"
  get "/posts/:id", to: "posts#show", as: "post"
  get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  post "/posts/", to: "posts#create"
  patch "/posts/:id", to: "posts#update"
  delete "/posts/:id", to: "posts#destroy", as: "destroy_post"

  post "/posts/new", to: "posts#new_beauty", as: "new_beauty_post"
  post "/posts/new", to: "posts#new_fashion", as: "new_fashion_post"
  get "/posts/:id", to: "posts#beauty", as: "beauty_post"
  get "/posts/:id", to: "posts#fashion", as: "fashion_post"
end
