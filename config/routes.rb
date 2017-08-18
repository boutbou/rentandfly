Rails.application.routes.draw do
  resources :drones do
    resources :rentals, only: [ :new, :create ]
  end

  resources :rentals, only: [:destroy]

  get 'dashboard', to: 'pages#dashboard'

  get 'drones/search', to: 'drones#search'

  # get 'rentals/index'

  # get 'rentals/show'

  # get 'rentals/destroy'


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
