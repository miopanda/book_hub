Rails.application.routes.draw do
  get 'requests/index'
  devise_for :users
  root to: "books#index"

  resources :users, only: :show

  resources :books, only: [:index, :new, :create, :show] do
    resources :loans, only: [:new, :create, :edit, :update]
  end

  resources :requests, only: [:index, :new, :create]
end
