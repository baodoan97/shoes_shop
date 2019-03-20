class CategoriesController < ApplicationController
  #layout 'layouts/adminshome'
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #include ActiveModel::AttributeMethods
  # GET /categories
  # GET /categories.json
  
  def show
    @product = @category.products.where("quantity > 0")
  end

  # GET /categories/new
  

  # POST /categories
  # POST /categories.json

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
