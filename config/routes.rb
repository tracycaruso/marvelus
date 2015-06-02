Rails.application.routes.draw do

  root to: "home#index"

  get "auth/twitter/callback", to: 'sessions#create'
  delete "logout", to: 'sessions#destroy'
  
  resources :users
  resources :characters

end
