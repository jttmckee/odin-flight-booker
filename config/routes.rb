Rails.application.routes.draw do

  resources :bookings, only: [:index,:new,:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "flights#index"
end
