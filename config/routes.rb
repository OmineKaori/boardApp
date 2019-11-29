Rails.application.routes.draw do
  get 'users/index' => "users#index"
  get "users/signup" => "users#new"
  get "users/:id" => "users#show"
  post "users/create" => "users#create"

  get 'posts/index' => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"

  get "/" => "home#top"
  get "about" => "home#about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
