Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new,:create]
  # resources :prototypes do
  #   resources :comments, only: :create
  # end
  # resources :users, only: :show
end
