Rails.application.routes.draw do
 root 'products#index'
 resources :products, only:[:show, :new, :create] do
  resources :purchases, only:[:new, :create]
  end
end
