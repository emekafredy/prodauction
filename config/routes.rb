# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'home#index'

  resources :items, only: %i[index new create show update destroy]
end
