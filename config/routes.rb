# frozen_string_literal: true

Rails.application.routes.draw do
  root 'customers#index'

  resources :transactions, only: %i[index show new]
  resources :accounts, only: %i[index show new]
  resources :connections, only: %i[index show new destroy]
  resources :providers, only: :index
  resources :customers, only: %i[index new]
  devise_for :users, controllers: { registrations: 'users/registrations' }
  post "callbacks/:type", to: 'callbacks#handler'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
