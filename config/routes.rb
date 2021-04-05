Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  get 'welcomes', to: 'welcomes#index'
  resources :posts
  resources :users, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
