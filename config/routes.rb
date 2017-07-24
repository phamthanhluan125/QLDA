Rails.application.routes.draw do

  root "static_pages#index"
  get "login" => "static_pages#login"

  devise_for :admins, :controllers => {:sessions => "admins/sessions"}

  resources :users
  resources :projects
  resources :tasks
  resources :project_managers
end
