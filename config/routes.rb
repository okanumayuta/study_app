Rails.application.routes.draw do
  
  devise_for :users
  root to: 'studies#index'
  resources :user, only: [:show]
  resources :studies, only: [:new, :create, :show, :edit, :update, :destroy,] do
    collection do
      get 'search'
    end
  end

end
