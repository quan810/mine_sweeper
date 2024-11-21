# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  post 'exit' => 'home#exit'
  resources :home, only: :create

  resources :boards, only: %i[index show new create]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
