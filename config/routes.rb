Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :show, :index ]
  post 'users/:id/friendships', to: 'friendships#create', as: :user_friendships_create
  resources :challenges, only: [ :new, :create, :index, :show ] do
    resources :challenge_users, only: [ :new, :create ]
    resources :goals, only: [ :new, :create ]
  end
  delete 'friendships/:id', to: 'friendships#destroy', as: :friendships_destroy
  patch 'friendships/:id', to: 'friendships#update', as: :friendships_update
  resources :friendships, only: [ :index ]
  patch 'challenge_users/:id', to: 'challenge_users#update'
  post 'goals/:id/progress_entries', to: 'progress_entries#create'
end
