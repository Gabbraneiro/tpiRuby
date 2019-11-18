Rails.application.routes.draw do
  resources :item_reservations
  resources :reservation_sells
  resources :item_sells
  resources :items
  resources :products
  resources :reservation_details
  resources :sell_details
  resources :reservations
  resources :sells
  resources :users
  resources :contact_phones
  resources :clients
  resources :vat_conditions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
