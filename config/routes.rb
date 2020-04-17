Rails.application.routes.draw do
  get 'users/index'
  get 'users/edit'
  get 'users/show'
  root to: 'homes#top'
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
