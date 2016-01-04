Rails.application.routes.draw do

  root 'users#index', as: :users

  get 'users/new' => 'users#new', as: :new_user
  get 'users/:id' => 'users#show', as: :user
  get 'users/sort' => 'users#sort'

  get 'users/:id/edit' => 'users#edit', as: :edit_user

  patch 'users/:id' => 'users#update'

  post '/' => 'users#create'

  get 'search' => 'users#search', as: 'search'

  # get 'search_results' => 'users#search_results', as: 'search_results'
  # get 'sessions/users/:id' => 'sessions#show', as: :show_session

  get 'sessions/new' => 'sessions#new', as: :new_session

  post 'sessions/new' => 'sessions#create', as: :create_session

  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  get 'targets/' => 'targets#index', as: :targets

end
