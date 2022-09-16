# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: %i[edit update destroy]
  resources :addresses, only: %i[edit update create]
  resources :books, only: %i[index show] do
    collection { post :index }
  end

  resources :categories, only: [] do
    resources :books, only: %i[index] do
      collection { post :index }
    end
  end
end
