class ArticlesController < ApplicationController

	def index
		@articles = Article.order({title: :asc, updated_at: :desc}).limit(25)
	end

	def show
		@article = Article.find(params[:id])
	end

	def new

	end

	def create

	end

end