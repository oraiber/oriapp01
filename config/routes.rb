Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root to: "tweets#index"
  
  resources :tweets do
    resources :comments, only: [:create, :destroy]
  end
  resources :users
end
