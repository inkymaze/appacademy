Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get 'users/new' => 'users#new', :as => 'new_user'
  # get 'users' => 'users#index', :as => 'users'
  # post 'users' => 'users#create'
  # get 'users/:id/edit' => 'users#edit', :as => 'edit_user'
  # get 'users/:id' => 'users#show', :as => 'user'
  # patch 'users/:id' => 'users#patch'
  # put 'users/:id' => 'users#put'
  # delete 'users/:id' => 'users#delete'

  resources :users, only: [:index, :create, :destroy, :update, :show] do
    resources :artworks, only: [:index]
    resources :artwork_shares, only: [:index]
  end
  resources :artworks, only: [:create, :destroy, :update, :show]
  resources :artwork_shares, only: [:create, :destroy]

  end
