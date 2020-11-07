Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
    resources :buyers do
      collection do
        get 'done'
        get 'delivery'
      end
    end
  root 'homes#index'
  resources :items
  
end


