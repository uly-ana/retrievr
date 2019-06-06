Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  get 'profile/:id', to: 'users#show', as: :profile
  get 'profile/:id/dogs', to: 'dogs#index'
  get 'profiles/:id/dogs/new', to: 'dogs#new', as: :new_user_dog
  post 'profiles/:id/dogs', to: 'dogs#create', as: :user_dogs
  post 'profile/:id/favorites', to: 'favorites#create', as: :new_favorite

  # resources :users, only: [:show, :index] do
  #   resources :dogs, only: [:new, :create]
  # end

  resources :activities do
    resources :activity_review, only: [:create]
    resources :activity_photos, only: [:create]
  end

  resources :orders, only: [:index, :show, :create, :new, :destroy] do
    resources :payments, only: [:new, :create]
  end

  resources :places
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
