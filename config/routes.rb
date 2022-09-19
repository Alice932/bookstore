# frozen_string_literal: true

Rails.application.routes.draw do
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

  resources :categories, only: [] do
    resources :books, only: %i[index] do
      collection { post :index }
    end
  end
end
