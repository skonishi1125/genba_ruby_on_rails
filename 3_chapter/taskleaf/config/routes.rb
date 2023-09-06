Rails.application.routes.draw do
  get '/login', to: 'sessions#new' # 元々の記載は get 'sessions/new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  namespace :admin do
    resources :users # get new | edit | show | index全て
  end
  resources :tasks
  root to: 'tasks#index'
end