Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  post 'users/:user_id/posts', to: 'posts#create', as: 'create_user_post'

  resources :posts, only: %i[new create] do
    post 'create_comment', on: :member
    member do
      post 'like'
    end
  end

  resources :comments, only: %i[new create]
  
  resources :users do
    resources :posts
  end

  resources :posts, only: [:index, :show, :new, :create] do 
    resources :comments, only: [:new, :create] 
    resources :likes, only: [:create]
  end
end
