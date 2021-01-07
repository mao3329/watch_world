Rails.application.routes.draw do
  devise_for :users do
    get:favorite_articles, on: :collection
  end
  resources :users, only: [:show]
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:create]
    resources :favorite_articles, only: [:create, :destroy]
  end
  resources :tags, only: [:index]
  resources :relationships, only: [:create, :destroy]
end
