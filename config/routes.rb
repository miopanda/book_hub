Rails.application.routes.draw do
  devise_for :users
  get 'books/index'
  root to: "books#index"

  resources :books, only: [:index, :new, :create, :show] do
    resources :loans, only: [:new, :create, :edit, :update]
  end
end
