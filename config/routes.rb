# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :users, only: %i[edit update destroy]
  # delete "/users/:id" => "users#destroy", as: :users_destroy
  resources :addresses, only: %i[edit update create]
  # match 'users/:id' => 'users#destroy', :via => :delete, :as => :user_destroy
  # get '/addresses', to: 'addresses#edit'
  # get '/addresses/:id', to: 'addresses#edit'
  # get '/users/:id', to: 'users#edit'

  resources :books, only: %i[index show] do
    collection { post :index }
  end

  resources :categories, only: [] do
    resources :books, only: %i[index] do
      collection { post :index }
    end
  end
end
