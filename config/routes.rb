Rails.application.routes.draw do
  resources :products
  resources :cart_items, only: [:create]
end
