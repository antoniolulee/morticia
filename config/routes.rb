Rails.application.routes.draw do
  resources :messages
  devise_for :users
  resources :operations
  
  root "operations#index"

  get "/about", to:"pages#about"

end
