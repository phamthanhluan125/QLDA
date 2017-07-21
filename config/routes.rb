Rails.application.routes.draw do

  root "static_pages#index"
  get "login" => "static_pages#login"

  devise_for :users, :controllers => {:sessions => "my_devise/sessions"}
end
