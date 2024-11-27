Rails.application.routes.draw do
  get 'locations/update'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :rides
  resources :locations, only: :update
  root "rides#index"

end
