Rails.application.routes.draw do
  resources :messages
  devise_for :users
  resources :operations
  get "/my-operations", to:"operations#my_operations"

  root "operations#index"

  get "/about", to:"pages#about"

  #refactor this
  

end
