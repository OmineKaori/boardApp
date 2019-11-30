Rails.application.routes.draw do
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  get 'users/index' => "users#index"
  get "users/signup" => "users#new"
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
