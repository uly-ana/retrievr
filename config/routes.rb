Rails.application.routes.draw do
  get 'activities_reviews/index'
  get 'activities_reviews/show'
  get 'activities_reviews/create'
  get 'activities_reviews/new'
  get 'activities_reviews/destroy'
  devise_for :users
  root to: 'pages#home'
  get 'profile/:id', to: 'users#show', as: :profile
  get 'profile/:id/dogs', to: 'dogs#index'
  get 'profile/:id/dogs/new', to: 'dogs#new', as: :user_dogs
  post 'profile/:id/dogs/new', to: 'dogs#create', as: :new_dog
  post 'profile/:id/favorites', to: 'favorites#create', as: :new_favorite

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
