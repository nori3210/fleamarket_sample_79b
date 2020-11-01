Rails.application.routes.draw do

  get 'buyers/index'
  get 'buyers/done'
  get 'buyers/delivery'
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
