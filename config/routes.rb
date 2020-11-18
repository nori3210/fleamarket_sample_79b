Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :items
  resources :card, only: [:new, :show] do
    collection do
      post 'index', to: 'card#index'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#destroy'
    end
  end
  resources :users
  resources :buyers do
    collection do 
      get  'done'
    end
  end

end


