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

  # get "/posts", to: "posts#index"
  # get "/posts/new", to: "posts#new", as: "new_post"
  get "/posts/:id", to: "posts#show", as: "post"
  get "/posts/:id/edit", to: "posts#edit", as: "edit_post"
  post "/posts/", to: "posts#create"
  patch "/posts/:id", to: "posts#update"
  delete "/posts/:id", to: "posts#destroy", as: "destroy_post"

  # get "/posts/beauty", to: "posts#index_beauty", as: "beauty"
  # get "/posts/fashion", to: "posts#index_fashion", as: "fashion"

  get "/beauty/posts/new", to: "posts#new_beauty", as: "new_beauty"
  get "/fashion/posts/new", to: "posts#new_fashion", as: "new_fashion"
  get "/beauty/posts", to: "posts#index_beauty", as: "index_beauty"
  get "/fashion/posts", to: "posts#index_fashion", as: "index_fashion"
  get "/beauty/posts/:id", to: "posts#show_beauty", as: "show_beauty"
  post "/beauty/posts", to:"posts#beauty_create", as: "beauty_create"
  post "/fashion/posts", to:"posts#fashion_create", as: "fashion_create"
end
