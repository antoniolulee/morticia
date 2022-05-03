Rails.application.routes.draw do
  root "operations#index"

  resources :messages, only: [:create, :new]
  devise_for :users
  resources :operations
  #get "checkout/create", to: "checkout#create"
  post "checkout/create", to: "checkout#create"
  get "/your-operations", to:"operations#your_operations"

  
  get "/about", to:"pages#about"

  
end
