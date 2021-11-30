Rails.application.routes.draw do
  resources :movie_evaluations do
    collection do
      get 'search'
    end
  end
  resources :tops
  root to: 'tops#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
