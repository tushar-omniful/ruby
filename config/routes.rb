Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  resources :sessions, only: [:create, :destroy]
end
