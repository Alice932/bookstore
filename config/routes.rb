# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :books, only: %i[index show] do
    collection { post :index }
  end

  resources :categories, only: [] do
    resources :books, only: %i[index] do
      collection { post :index }
    end
  end
end
