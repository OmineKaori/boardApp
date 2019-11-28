Rails.application.routes.draw do
  get 'posts/index' => "posts#index"
  get "posts/index/:id" => "posts#show"
  get "/" => "home#top"
  get "about" => "home#about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
