Rails.application.routes.draw do
  root to: 'home#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :users, only: [:index,:show,:edit,:update] do
    resources :likes, only: [:index]
  end

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

end
