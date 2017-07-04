Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  resources :friends
  resources :users do
    member do
      post :join, :quit
    end
  end

end
