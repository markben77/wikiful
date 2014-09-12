class WelcomeController < ApplicationController

  def index
  	@recentArticles = Article.order(created_at: :desc).limit(5)
  end

end
