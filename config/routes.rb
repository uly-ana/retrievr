Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile/:id', to: 'users#show', as: :profile
  get 'profile/:id/dogs', to: 'dogs#index'
  post 'profile/:id/dogs', to: 'dogs#create', as: :new_dog
  post 'profile/:id/favorites', to: 'favorites#create', as: :new_favorite

  resources :activities do
    resources :activity_review, only: [:create]
  end

  resources :order, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end

  resources :places
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
