class CategoriesController < ApplicationController
	
	def index
		@categories = Category.order(name: :asc)
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def edit
		@category = Category.find(params[:id])
		@articles = Article.where(category_id: params[:id])
	end


	def create
		@category = Category.new(category_params)
		if (@category.save)
			redirect_to @category
		else
			render "new"
		end

	end

	private

		def category_params
			params.require(:category).permit(:id, :name)
		end
end
