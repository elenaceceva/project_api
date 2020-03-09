Rails.application.routes.draw do
  use_doorkeeper

  apipie
  devise_for :users
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'api/v1/tasks#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :tasks
      end
    end
  end
  resources :tasks, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
