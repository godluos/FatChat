Rails.application.routes.draw do
  devise_for :users
  root "chats#index"

  resources :friendships
  resources :chats, only: [:index, :show]
  resources :messages
  resources :users, only: [:index]

end
