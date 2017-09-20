Rails.application.routes.draw do

  devise_for :users

  root 'groups#index'

  resources :users, only: [:edit, :update]

  resources :groups, only:[:index, :edit, :new, :create, :update] do
    resources :messages, only:[:index, :new, :create, :update]
  end

  end
