Rails.application.routes.draw do
  devise_for :users

  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  get "search" => "games#search"

  resources :users do
    resources :requests
  end

  resources :games do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  namespace :admin do
    resources :requests do
      member do
        put 'approve'
        put 'reject'
      end
    end
    resources :users
  end
end
