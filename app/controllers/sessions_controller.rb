class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    admin_user = AdminUser.find_by(email: params[:session][:email].downcase)
    if admin_user && admin_user.authenticate(params[:session][:password])
      login(admin_user)
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
