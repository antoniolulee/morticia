Rails.application.routes.draw do
  resources :messages, only: [:create, :new]
  devise_for :users
  resources :operations
  get "/your-operations", to:"operations#your_operations"

  root "operations#index"

  get "/about", to:"pages#about"

  #refactor this
  

end
