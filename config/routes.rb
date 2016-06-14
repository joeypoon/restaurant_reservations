Rails.application.routes.draw do
  root 'reservations#index'
  resources :reservations, only: [:index, :create]
end
