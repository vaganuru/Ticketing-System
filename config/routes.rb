Rails.application.routes.draw do
  resources :users
  resources :tickets
  root "tickets#index"
end
