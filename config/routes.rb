Rails.application.routes.draw do
  resources :users
  resources :tickets, except: [:show]
  root "tickets#index"
end
