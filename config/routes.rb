Rails.application.routes.draw do
  resources :orders, only: [:new, :create, :show, :destroy]
  devise_for :drivers, path: 'drivers', controllers: { sessions: "drivers/sessions", registrations: "drivers/registrations"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  root 'home#home'
  get '/pick_up', to: 'orders#pick_up', as: 'pick_up'
  get '/destination', to: 'orders#destination', as: 'destination'
  post '/pick_up', to: 'orders#pick_up_post'
  post '/destination', to: 'orders#destination_post'
  get '/driver/order_page', to: 'drivers/home#order_page', as: 'driver_order_page'
  post '/confirmation', to: 'drivers/home#completed_confirmation', as: 'completed_confirmation'
  get '/history', to: 'orders#history', as: 'history'
end
