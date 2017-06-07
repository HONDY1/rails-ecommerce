Rails.application.routes.draw do

  devise_for :admins
  devise_for :users
  namespace :admin do
    resources :dashboards
    resources :products
  end
  resources :products, only: [:index,:show]

  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  root to: "index#index"
  get 'admin/' => redirect('admin/products')


end
