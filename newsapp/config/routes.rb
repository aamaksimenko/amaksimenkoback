Rails.application.routes.draw do
  devise_for :users,
              controllers: {
                sessions: 'users/sessions',
                registrations: 'users/registrations'
              }
  get '/member-data', to: 'members#show'
  get '/profile', to: 'users#show_current_user'
  resources :news, only: [:index, :show, :create, :update]
  resources :users, only: [:index, :update]
end
