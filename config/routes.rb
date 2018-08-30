Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'charges/new'
  get 'charges/create'
  get '/top', to: 'home#top'
  # get 'cart/index'
  # get 'cart/create'
  # get 'home/top'
  resources :items
  resources :cart
  resources :charges
    # resources :pictures, only: [:create] do
    # member do
    #   get :download
    # end
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
