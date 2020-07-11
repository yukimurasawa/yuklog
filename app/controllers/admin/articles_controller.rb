class Admin::ArticlesController < ApplicationController
  before_action :load_resource
  before_action :require_admin_login

  def index; end

  def create
    @article = Article.create(article_params)
    redirect_to admin_article_path(@article)
  end

  private

  def load_resource
    case params[:action].to_sym
    when :index
      @articles = Article.order(created_at: 'DESC')
    end
  end

  def article_params
    params.require(:article).permit(:title, :description, :content)
  end
end
