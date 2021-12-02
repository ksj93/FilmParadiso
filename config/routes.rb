Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
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

  root to: 'tops#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
