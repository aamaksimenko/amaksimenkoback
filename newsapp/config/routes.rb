Rails.application.routes.draw do
  devise_for :users
  resources :news, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create, :update]
end
