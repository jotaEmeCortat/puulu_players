Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'dashboard', to: 'dashboards#profile', as: 'dashboard'

  resources :players do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, except: %i[new create] do
    member do
      patch 'accepted', to: 'bookings#accepted'
      patch 'declined', to: 'bookings#declined'
    end
  end
end
