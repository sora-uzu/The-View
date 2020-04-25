Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:index,:show,:edit,:update] do
    resources :likes, only: [:index]
    member do
      get :following, :followers, :map
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end
  get '/rank',to: 'posts#rank'
  get '/map', to: 'posts#map'
end
