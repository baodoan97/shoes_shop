class CategoriesController < ApplicationController
	before_action :set_category
	def show
		@prod =  @category.products
	end


	private
	def set_category
		@category = Category.find(params[:id])
	end
	def category_params
		params.require(:category).permit(:name)
	end
end