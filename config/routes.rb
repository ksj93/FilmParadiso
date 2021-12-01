Rails.application.routes.draw do
  devise_for :users
  resources :movie_evaluations do
    collection do
      get 'search'
    end
  end
  resources :tops
  root to: 'tops#index'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
