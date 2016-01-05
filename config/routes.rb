Rails.application.routes.draw do

  root 'users#index', as: :users

  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :user
  get 'users/sort' => 'users#sort'
  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'
  post '/' => 'users#create'

  get 'jams/all' => 'jams#index', as: :jams
  get 'jams/new' => 'jams#new', as: :new_jam
  post 'jams/new' => 'jams#create', as: :create_jam
  get 'jams/sort' => 'jams#sort'

  get 'jams/:id' => 'jams#show', as: :jam
  get 'jams/:id/edit' => 'jams#edit', as: :edit_jam
  patch 'jams/:id' => 'jams#update'
  delete 'jams/:id' => 'jams#destroy'



  get 'search' => 'users#search', as: 'search'
  get 'jamsearch' => 'jams#search', as: 'jam_search'
  get 'search_results' => 'users#search_results', as: 'search_results'
  # get 'sessions/users/:id' => 'sessions#show', as: :show_session
  # get 'targets/' => 'targets#index', as: :targets

  get 'sessions/new' => 'sessions#new', as: :new_session

  post 'sessions/new' => 'sessions#create', as: :create_session

  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session



end
