class StaticPagesController < ApplicationController
layout "login", only: :login
  def index
    redirect_to login_path if !admin_signed_in?
  end

  def login
    redirect_to new_admin_session_path
  end
end
