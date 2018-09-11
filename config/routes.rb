Rails.application.routes.draw do
  resources :orders, only: [:new, :create, :show :destroy]
  devise_for :drivers, path: 'drivers', controllers: { sessions: "drivers/sessions", registrations: "drivers/registrations"}
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions", registrations: "users/registrations"}
  root 'home#home'
end
