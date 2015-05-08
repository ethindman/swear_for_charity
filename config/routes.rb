Rails.application.routes.draw do

  root 'sessions#new'

  get 'logout' => 'sessions#destroy'
  get 'profile' => 'mains#profile'
  get 'search' => 'mains#search'
  get 'about' => 'mains#about'

  resources :missions, :users, :mains
  resources :sessions, only: [:new, :create, :destroy]
  resources :friendships, only: [:create, :destroy, :update]

end