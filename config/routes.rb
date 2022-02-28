Rails.application.routes.draw do
  root "operations#index"

  get "/about", to:"pages#about"
  
  resources :operations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
 

  devise_for :users

end
