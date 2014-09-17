class ArticlesController < ApplicationController

	before_filter :authorize, only: [:new]

	def index
		@articles = Article.order({title: :asc, updated_at: :desc}).limit(25)
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])	
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render "new"
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render "update", flash: "error of some kind"
		end
	end

	private

		def article_params
			params.require(:article).permit(:title, :content, :category_ids => [])
		end

end