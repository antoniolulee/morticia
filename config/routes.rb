Rails.application.routes.draw do
  root "pages#main"

  resources :messages, only: [:create, :new]
  devise_for :users
  resources :operations
  resources :webhooks, only: [:create]
  post "checkout/create", to: "checkout#create"
  get "/your-operations", to:"operations#your_operations"
  get "/your-messages", to:"messages#your_messages"

  
  get "/about", to:"pages#about"


  
end
