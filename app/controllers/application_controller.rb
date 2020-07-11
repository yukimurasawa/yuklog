class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def require_admin_login
    unless logged_in?
      flash[:error] = 'ログインしてください'
      redirect_to login_url
    end
  end
end
