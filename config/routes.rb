Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  root 'homes#index'
  resources :items
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  resources :users
end
