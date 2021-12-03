Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # resources :users, only: [:index,:show]
  get 'users/show'
  get 'users/index'
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end
  resources :movie_evaluations do
    collection do
      get 'search'
    end
  end
  resources :tops do
    collection do
      get 'search'
    end
  end
  resources :conversations do
    resources :messages
  end
  root to: 'tops#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
