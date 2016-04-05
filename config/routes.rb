Rails.application.routes.draw do
  root "sessions#new"
  resources :users, only: [:new, :create, :show] do
    resources :goals, only: :new
  end

  resource :session, only: [:new, :create, :destroy]

  resources :goals, except: [:index, :new]
end
