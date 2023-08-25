Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # get '/search', to: 'players#search', as: 'search'
  # get '/users/sign_in', to: redirect("/sign-in")
  # get '/users/sign_up', to: redirect("/sign-up")
  # get '/users/sign_out', to: redirect("/sign-out")

  get 'users/:id', to: 'users#show', as: 'profile'
  get 'users/:id/edit', to: 'users#edit', as: 'update_user'
  patch 'users/:id', to: 'users#update', as: 'edit_user'
  put 'users/:id', to: 'users#update'

  get 'dashboard', to: 'dashboards#profile', as: 'dashboard'

  resources :players do
    resources :bookings, only: %i[index new create edit update]
  end

  resources :bookings, except: %i[new create]
end
