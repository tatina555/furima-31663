Rails.application.routes.draw do
  devise_for :users
  #get 'furima/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root  to: 'furima#index'

  resources :items, only: [:index, :create, :new]

end
