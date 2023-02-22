Rails.application.routes.draw do
  get 'tokens/create'
  resources :users
  resources :bookings
  resources :cars, only: [:index, :show, :create, :update, :destroy]
  resources :tokens, only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
