class WelcomeController < ActionController::Base

  layout 'application'
  
  def index
    @articles = Article.order(created_at: 'DESC')
  end
end
