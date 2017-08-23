Rails.application.routes.draw do

  get 'profile/edit'

  get 'profile/update'

  get 'drones/search', to: 'drones#search'


  resources :drones do
    resources :rentals, only: [ :new, :create ]
  end

  resources :rentals, only: [:destroy, :show]

  get 'dashboard', to: 'pages#dashboard'

  get 'myrentals', to: 'pages#myrentals'


  resources :profile, only: [ :edit, :update ]

  mount Attachinary::Engine => "/attachinary"

  # get 'profile/edit', to: 'profile#edit'

  # patch 'profile/update', to: 'profile#update'

  # get 'rentals/index'

  # get 'rentals/show'

  # get 'rentals/destroy'


  devise_for :users, :controllers => { registrations:  "users/registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
