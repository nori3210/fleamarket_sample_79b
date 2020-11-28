Rails.application.routes.draw do
  root 'homes#index'

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
end
