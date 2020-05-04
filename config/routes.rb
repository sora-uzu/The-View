# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: %i[index show edit update] do
    resources :likes, only: [:index]
    member do
      get :following, :followers, :map
    end
  end

  resources :relationships, only: %i[create destroy]

  resources :posts do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create edit update destroy]
  end
  get '/rank', to: 'posts#rank'
  get '/map', to: 'posts#map'
end
