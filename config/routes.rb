Rails.application.routes.draw do

  root "static_pages#index"
  get "login" => "static_pages#login"

  devise_for :users, path: 'users', controllers: {sessions: "users/sessions"}
  devise_for :managers, path: 'managers', controllers: {sessions: "managers/sessions"}

  resources :staffs
  resources :projects
  resources :tasks
  resources :project_managers
  resources :task_managers
  resources :timesheets
  resources :roles
  resources :messages

  api_version(module: "V1", path: {value: "v1"}, default: true) do
    resources :users, defaults: {format: :json}
    resources :authen_user_tokens, only: :index, defaults: {format: :json}
    resources :projects, defaults: {format: :json}
    resources :tasks, defaults: {format: :json}
    resources :messages, default: {format: :json}
    resources :managers, default: {format: :json}
    resources :timesheets, default: {format: :json}
    resources :screenshots, default: {format: :json}
  end
end
