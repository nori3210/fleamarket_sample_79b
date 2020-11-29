Rails.application.routes.draw do

  devise_for :users
  
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
    collection do
      get 'done'
      get 'delivery'
    end
  end
end


