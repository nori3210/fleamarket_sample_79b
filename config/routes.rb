Rails.application.routes.draw do


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


