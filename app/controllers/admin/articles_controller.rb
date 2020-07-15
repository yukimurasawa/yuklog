class Admin::ArticlesController < ApplicationController
  before_action :load_resource
  before_action :require_admin_login

  def index; end

  def show; end

  def edit; end

  def create
    @article = Article.create(article_params)
    redirect_to admin_article_path(@article)
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(article_params)
      flash[:notice] = "更新しました"
      redirect_to @article
    else
      flash.now[:notice] = "編集に失敗しました"
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to admin_articles_path, flash: { notice: "記事の削除に成功しました!" }
    else
      redirect_to admin_articles_path, flash: { error: "記事の削除に失敗しました!" }
    end
  end

  private

  def load_resource
    case params[:action].to_sym
    when :index
      @articles = Article.order(created_at: 'DESC')
    when :destroy
      @article = Article.find(params[:id])
    when :show
      @article = Article.find(params[:id])
    when :edit
      @article = Article.find(params[:id])
    end
  end

  def article_params
    params.require(:article).permit(:title, :description, :content)
  end
end
