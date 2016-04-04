Rails.application.routes.draw do
  root "sessions#new"
  resources :users, only: [:new, :create]
  resource :sesssion, only: [:new, :create, :destroy]
end
