Rails.application.routes.draw do
  root 'items#index'
  resources :buyers do
    collection do
      get 'done'
      get 'delivery'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
