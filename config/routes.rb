Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :show, :index ]
  get 'users/:id/friendships', to: 'friendships#create'

  resources :challenges, only: [ :new, :create, :index, :show ] do
    resources :challenge_users, only: [ :new, :create ]
    resources :goals, only: [ :new, :create ]
  end
  resources :friendships, only: [ :index, :update ]
  patch 'challenge_users/:id', to: 'challenge_users#update'
  post 'goals/:id/progress_entries', to: 'progress_entries#create'
end
