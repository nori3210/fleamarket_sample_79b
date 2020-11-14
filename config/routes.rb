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

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'homes#index'
  resources :items
  resources :buyers do
    collection do
      get 'done'
      get 'delivery'
    end
  end

end


