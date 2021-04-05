Rails.application.routes.draw do
  root "posts#index"
  get 'welcomes', to: 'welcomes#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :posts do
    resources :comments
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
