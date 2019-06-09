Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'

  get 'profile/:id', to: 'users#show', as: :profile
  get 'profile/:id/dogs', to: 'dogs#index'
  post 'profile/:id/dogs', to: 'dogs#create',as: :user_dogs
  get 'profile/:id/dogs/new', to: 'dogs#new', as: :new_user_dog
  get 'profile/dogs/:id/edit', to: 'dogs#edit', as: :edit_user_dog
  patch 'profile/dogs/:id', to: 'dogs#update', as: :update_user_dog

  delete 'profile/dogs/:id', to: 'dogs#destroy', as: :destroy_dogs
  # post 'profile/:id/favorites', to: 'favorites#create', as: :new_favorite
  # post 'activity_review/', to: 'activity_reviews#create', as: :new_activity_review


  resources :activities do
    resources :activity_reviews, only: [:create]
    resources :activity_photos, only: [:create]
    resources :favorites, only: [:create]
  end


  resources :orders, only: [:index, :show, :create, :new, :destroy] do
    resources :payments, only: [:new, :create]
  end

  resources :places do
    resources :favorites, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
