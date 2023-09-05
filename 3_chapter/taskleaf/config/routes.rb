Rails.application.routes.draw do
  namespace :admin do
    # get 'users/new'
    # get 'users/edit'
    # get 'users/show'
    # get 'users/index'
    resources :users
  end
  resources :tasks
  root to: 'tasks#index'
end