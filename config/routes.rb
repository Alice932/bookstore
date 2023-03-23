# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  begin
    ActiveAdmin.routes(self)
  rescue StandardError
    ActiveAdmin::DatabaseHitDuringLoad
  end
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: %i[edit update destroy]
  get '/users/:id', to: 'users#edit'
  resources :addresses, only: %i[edit update create]
  resources :books, only: %i[index show] do
    collection { post :index }
  end
  resources :reviews, only: %i[create]
  resources :order_items, only: %i[create destroy update]
  resource :cart, only: %i[show]
  resource :coupon, only: %i[update]
  resource :checkout, only: %i[show update]

  resources :categories, only: [] do
    resources :books, only: %i[index] do
      collection { post :index }
    end
  end

  resource :quick_registration, only: %i[create show]
end
