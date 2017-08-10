Rails.application.routes.draw do

  root "static_pages#index"
  get "login" => "static_pages#login"

  devise_for :users, path: 'users', controllers: {sessions: "users/sessions"}
  devise_for :admins, path: 'admins', controllers: {sessions: "admins/sessions"}

  resources :staffs
  resources :projects
  resources :tasks
  resources :project_managers
  resources :task_managers

  api_version(module: "V1", path: {value: "v1"}, default: true) do
    resources :users, defaults: {format: :json}
    resources :authen_user_tokens, only: :index, defaults: {format: :json}
    resources :projects, defaults: {format: :json}
    resources :tasks, defaults: {format: :json}
    resources :messanges, default: {format: :json}
    resources :admins, default: {format: :json}
    resources :timesheets, default: {format: :json}
    resources :screenshots, default: {format: :json}
  end
end
