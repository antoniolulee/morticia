Rails.application.routes.draw do
  devise_for :users
  resources :operations
  
  root "operations#index"

  get "/about", to:"pages#about"

end
