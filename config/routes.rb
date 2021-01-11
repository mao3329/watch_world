Rails.application.routes.draw do
  root to: 'articles#index'
  get "search", to: 'articles#search'
  devise_for :users do
    get:favorite_articles, on: :collection
  end

  resources :users, only: [:show]

  resources :articles do
    resources :comments, only: [:create]
    resources :favorite_articles, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :show]

  resources :relationships, only: [:create, :destroy]
end
