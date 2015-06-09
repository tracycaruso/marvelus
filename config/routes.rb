Rails.application.routes.draw do

  root to: "home#index"

  get "auth/twitter/callback", to: 'sessions#create'
  delete "logout", to: 'sessions#destroy'
  
  resource :user
  # get "/users", to: 'users#show'
  resources :superheros

end
