Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #root to: "home#index", as: 'home_page'
  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end
  resources :users
  resources :groups, only: [:index, :new, :create, :show]
  resources :entities, only: [:index, :new, :create, :show]
end
