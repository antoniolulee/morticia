Rails.application.routes.draw do
  
  resources :operations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "operations#index"
end
