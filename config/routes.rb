Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  root 'card#show'
  resources :items, only: [:show]
end
