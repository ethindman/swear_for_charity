Rails.application.routes.draw do

  root 'sessions#new'

  get 'logout' => 'sessions#destroy'

  resources :missions, :users, :mains
  resources :sessions, only: [:new, :create, :destroy]
  resources :friendships, only: [:create, :destroy]

end