Rails.application.routes.draw do
  devise_for :users
  #get 'furima/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  to: 'furima#index'

  #root to: 'items#index'
  resources :items, only: [:edit, :new, :create]

end
