Rails.application.routes.draw do
  post "replies/:id/create" => "replies#create"

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get 'users/index' => "users#index"
  get "signup" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"

  post "posts/:id/update" => "posts#update"
  get "posts/:id/edit" => "posts#edit"
  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  post "posts/:id/destroy" => "posts#destroy"

  get "/" => "home#top"
  get "about" => "home#about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
