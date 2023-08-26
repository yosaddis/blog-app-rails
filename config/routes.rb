Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'users#index'

  get "/users/", to: "users#index", as:"users_index"
  get "/users/:id", to: "users#show", as: 'user_show'
  get "/users/:user_id/posts", to: "posts#index", as: 'user_posts'
  get "/users/:user_id/posts/:id", to: "posts#show", as: 'user_post'

  get '/users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  post '/users/:user_id/posts/new', to: 'posts#create', as: 'create_post'
  get '/comment/new/:post_id', to: 'comments#new', as: 'new_comment'
  post '/comment/new/:post_id', to: 'comments#create', as: 'create_comment'
  post '/likes/new', to: 'likes#create', as: 'create_like'

  # Defines the root path route ("/")
  # root "articles#index"
end
