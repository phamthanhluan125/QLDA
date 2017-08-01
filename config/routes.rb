Rails.application.routes.draw do

  devise_for :users
  root "static_pages#index"
  get "login" => "static_pages#login"

  devise_for :admins, :controllers => {:sessions => "admins/sessions"}

  resources :users
  resources :projects
  resources :tasks
  resources :project_managers
  resources :task_managers

  api_version(module: "V1", path: {value: "v1"}, default: true) do
    resources :users, defaults: {format: :json}
    resources :authen_user_tokens, only: :index, defaults: {format: :json}
  end
end
