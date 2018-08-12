Rails.application.routes.draw do
  # get 'cart/index'
  # get 'cart/create'
  # get 'home/top'
  resources :items
  resources :cart
  root 'home#top'
    resources :pictures, only: [:create] do
    member do
      get :download
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
