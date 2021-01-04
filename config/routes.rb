Rails.application.routes.draw do
  devise_for :users do
    get:favorite_articles, on: :collection
  end
  root to: 'articles#index'
  resources :articles do
    resources :comments, only: [:create]
    resources :favorite_articles, only: [:create, :destroy]
  end
end
