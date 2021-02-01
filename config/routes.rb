Rails.application.routes.draw do
  get 'reservations/index'
  get 'posts/index'
  get 'users/index'
  root 'home#top'
  get 'sessions/new'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  post "users/:id/update" => "users#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 resources :users
 resources :posts
 resources :reservations
end
