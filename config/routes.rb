# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :books, only: %i[index show] do
    collection do
      post :index
    end
  end
  resources :categories, only: [] do
    resources :books, only: %i[index] do
      collection do
        post :index
      end
    end
  end
end
