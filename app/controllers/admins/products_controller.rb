class Admins::ProductsController < BaseController
    before_action :set_product , only: [:edit,:update, :show,:destroy]
	#include ActiveModel::AttributeMethods
	def index
		@product = Product.all
	end

  def show

  end

  def destroy
      if @product.destroy
        flash[:success] = "Product was successfully deleted"
        redirect_to  admins_products_path
      else
        redirect_to  admins_homepage_path
      end
	end

  def new
    @product = Product.new
    @product.stocks.new
  end
    def create
		paPRODUCT = {
        	 "name" => product_params[:name],
        	 "price" => product_params[:price],
           "stocks_attributes" => product_params[:stocks_attributes],
        	 "description" => product_params[:description],
         }
			@product = Product.new(paPRODUCT)
			#	debugger
		  @product.category = Category.find(params[:product][:category].to_i)
             # debugger
        if params[:product][:images] == nil
           return
        end
        @product.images.attach(params[:product][:images])
				#debugger
        if @product.save
	        flash[:success] = "Product was created successfully"
    			redirect_to admins_products_path
			# debugger
    		else
    			render 'products/new'
    		end
    	end

	def edit
		
	end

  def update
       paPRODUCT = {
        	 "name" => product_params[:name],
        	 "price" => product_params[:price],
        	 "stocks" => product_params[:quantity],
        	 "description" => product_params[:description],
         }
         @product.category = Category.find(params[:product][:category].to_i)
      	if params[:product][:images] != nil 
       		@product.images.attach(params[:product][:images])
        end
		if @product.update(paPRODUCT)       	
			flash[:success] = "Product was updated"
			redirect_to edit_admins_product_path(@product)
		else
			render 'edit'
		end
    end

	def destroyimage
		   if params[:product] 
            @product = Product.find(params[:product])
             @product.images[params[:images].to_i].destroy
		   end
		   redirect_to edit_product_path(@product.id.to_i)
	end
    	private

	def product_params     
		params.require(:product).permit(:name, :price, :description, :category_id, stocks_attributes: [:size, :quantity, :_destroy])
	end
    
	def set_product
        if Product.exists? id: params[:id] 
            @product = Product.find(params[:id])
        else
            redirect_to root_path
            flash[:danger] = "Product is not exist"
        end     
    end 
end