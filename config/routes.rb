Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:show]
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
