Rails.application.routes.draw do

  root 'users#index', as: :users

  get 'users/new' => 'users#new', as: :new_user
  get 'search/sort' => 'users#sort', as: :users_sort
  post '/' => 'users#create'
  get 'users/:id' => 'users#show', as: :user
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'

  get 'search1/sort' => 'jams#sort', as: :jams_sort

  get 'jams/all' => 'jams#index', as: :jams
  get 'jams/new' => 'jams#new', as: :new_jam
  post 'jams/new' => 'jams#create', as: :create_jam

  get 'jams/:id' => 'jams#show', as: :jam
  get 'jams/:id/edit' => 'jams#edit', as: :edit_jam
  patch 'jams/:id' => 'jams#update'
  delete 'jams/:id' => 'jams#destroy'


  get 'search1' => 'jams#search', as: 'search1'
  get 'search' => 'users#search', as: 'search'
  # get 'search_results' => 'users#search_results', as: 'search_results'
  # get 'sessions/users/:id' => 'sessions#show', as: :show_session
  # get 'targets/' => 'targets#index', as: :targets

  get 'sessions/new' => 'sessions#new', as: :new_session

  post 'sessions/new' => 'sessions#create', as: :create_session

  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  namespace :api do
    resources :jams, only: [:index, :show]
  end

end
