Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    }
    devise_scope :user do
      get  'addresses', to: 'users/registrations#new_address'
      post 'addresses', to: 'users/registrations#create_address'
    end
    
  resources :addresses, only: :index

  devise_scope :user do
    get 'users/sign_up/complete', to: 'users/registrations#complete'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  root 'homes#index'

  resources :items do
    collection do
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :item_images
  resources :buyers do

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

  resources :sellers, only: index
end


