Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :account_block do
    resources :accounts 
    resources :users 
    post "/login" , to: "users#login"
  end
end
