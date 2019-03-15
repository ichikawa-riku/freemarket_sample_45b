Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: 'users/registrations' ,
  omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'products#index'

  resources :products, only: [:show, :new, :create, :edit, :update] do
    resources :purchases, only: [:new, :create]
  end

  resources :categories, only: [:index, :show] do
    collection do
      get 'sub_category'
      get 'category'
    end
  end

  resources :brands, only: [:index, :show] do
  end

  resources :users, only: [:new, :show, :edit, :update] do
    collection do
      get 'signout'
    end
    resources :profiles, only: [:new]
    resources :credit_card, only: [:index, :new, :create]
  end


end
