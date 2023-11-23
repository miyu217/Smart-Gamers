Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  devise_for :users

  root to: 'homes#top'
  get 'home/about', to: 'homes#about'
  get "search" => "games#search"

  resources :users do
    resources :requests
  end
  resources :games do
    member do
      post 'favorite', to: 'favorites#create'
      delete 'favorite', to: 'favorites#destroy'
    end
    resources :reviews
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
