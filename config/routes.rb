Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "home#index", as: 'home_page'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
  resources :groups, only: [:index, :new, :create, :show]
  resources :entities, only: [:index, :new, :create, :show]
end
