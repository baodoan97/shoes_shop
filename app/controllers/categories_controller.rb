class CategoriesController < ApplicationController
  #layout 'layouts/adminshome'
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #include ActiveModel::AttributeMethods
  # GET /categories
  # GET /categories.json
  
  def show
    @product = @category.products.where("quantity > 0")
    @product = @product.paginate(page: params[:page], per_page: 3)
  end

  # GET /categories/new
  

  # POST /categories
  # POST /categories.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      if Category.exists? id: params[:id] 
        @category = Category.find(params[:id])
      else
        redirect_to root_path
        flash[:danger] = "Category with ID = #{params[:id]} is not exist"
    end 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
