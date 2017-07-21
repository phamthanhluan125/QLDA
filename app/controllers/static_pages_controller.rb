class StaticPagesController < ApplicationController
layout "login", only: :login
  def index
    redirect_to login_path if !user_signed_in?
  end

  def login
    redirect_to new_user_session_path
  end
end
