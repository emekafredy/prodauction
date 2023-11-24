# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'search', to: 'search#search'
  root 'home#index'
  resources :items, only: %i[index new create show edit update destroy]
end
