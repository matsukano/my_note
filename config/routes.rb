Rails.application.routes.draw do
  root to: 'notes#index'
  resources :notes do
    collection do
      get 'search'
    end
  end
end
