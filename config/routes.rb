Rails.application.routes.draw do
  devise_for :users
  root "chats#index"

  resources :chats, only: [:index, :show]
  resources :messages, only: [:new, :create]
  resources :users, only: [:index]

end
