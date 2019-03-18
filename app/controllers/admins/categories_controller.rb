class Admins::CategoriesController < ApplicationController
  #layout 'layouts/adminshome'
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  #include ActiveModel::AttributeMethods
  # GET /categories
  # GET /categories.json
  def index
    @categories = Admins::Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    
  end

  # GET /categories/new
  def new
    @category = Admins::Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Admins::Category.new(category_params)
    
    if @category.save
			#session[:user_id] = @categories.id
		#	flash[:success] = "ssASAs, #{@categories.name}"
			#redirect_to admins_category_path()
		else
			render 'new'
		end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
   
      if @category.update(category_params)
      
      flash[:success] =  'Category was successfully updated.'
      redirect_to admins_category_path(@categories)
      else
       render 'edit'
      end
    
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    redirect_to admins_categories_path()
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
     # debugger
      params.require(:admins_category).permit(:name, :description, :display_in_navbar)
    end
end
