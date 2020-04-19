Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:index,:show,:edit,:update] do
    resources :likes, only: [:index]
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

end
