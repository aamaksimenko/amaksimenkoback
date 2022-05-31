Rails.application.routes.draw do
  resources :news, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :show, :create, :update]
end
