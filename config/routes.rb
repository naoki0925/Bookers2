Rails.application.routes.draw do
  devise_for :users
  root to: 'users#top'
  get "home/about" => "homes#about"
  resources :users, only: [:new, :show, :index, :create, :edit, :update]do
    resource :relationships, only: [:create, :destroy]
  end
  resources :books, only: [:new, :show, :index, :create, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get 'search' => 'searches#search'
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]
end
