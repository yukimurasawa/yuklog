class Admin::ArticlesController < ApplicationController
  before_action :load_resource
  before_action :require_admin_login

  def index; end

  private
    def load_resource
      case params[:action].to_sym
      when :index
        @articles = Article.order(created_at: "DESC")
      end
    end
end
