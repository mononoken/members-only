Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'home#index'
  root 'posts#index'

  resources :posts, only: %i[new create index]
end
