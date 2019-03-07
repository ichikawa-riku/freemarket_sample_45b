Rails.application.routes.draw do

  devise_for :users
  root 'products#index'
<<<<<<< HEAD
=======

>>>>>>> Ykum4/master
  resources :products, only: [:show, :new, :create] do
    resources :purchases, only: [:new, :create]
  end

<<<<<<< HEAD
  resources :users, only: [:show] do
    resources :user_details, only: [:new, :create, :edit, :update, :show]
<<<<<<< HEAD
    resources :credit_card, only: [:new]
=======
=======
  resources :users, only: [:new, :show, :edit] do
    collection do
      get 'signout'
    end
    resources :profiles, only: [:new]
>>>>>>> Ykum4/master
    resources :credit_card, only: [:new, :show]
>>>>>>> Ykum4/master
  end


end
