Rails.application.routes.draw do

  resources :bookings, only: [:new,:create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "flights#index"
end
