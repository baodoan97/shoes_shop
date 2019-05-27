class CategoriesController < ApplicationController
  #layout 'layouts/adminshome'
  before_action :set_category, only: [:show]
  #include ActiveModel::AttributeMethods
  # GET /categories
  # GET /categories.json

  def show
    if params[:sort] && params[:show]
      case params[:sort]
      when "1"
        @products = @category.order(id: :desc).paginate(page: params[:page], per_page: params[:show])
      when "2"
        @products = @category.order(:price).paginate(page: params[:page], per_page: params[:show])
      when "3"
        @products = @category.order(price: :desc).paginate(page: params[:page], per_page: params[:show])
      when "4"
        @products = @category.order(:name).paginate(page: params[:page], per_page: params[:show])
      else
        @products = @category.order(name: :desc).paginate(page: params[:page], per_page: params[:show])
      end
    else
      if params[:brand_id].to_i != 0
        @products = @category.order(id: :desc).paginate(page: params[:page], per_page: 8)
      else
        @products = @category.paginate(page: params[:page], per_page: 8)
      end
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  # GET /categories/new


  # POST /categories
  # POST /categories.json

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    if Category.exists? id: params[:id]
      if params[:brand_id].to_i != 0
        @category = Category.find(params[:id]).products.where(brand_id: params[:brand_id])
      else
        @category = Category.find(params[:id]).products
      end
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
