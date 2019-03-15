# class CartProductsController < ApplicationController
# 	before_action :set_cart, only: [:create, :destroy]
   
# 	  def create
# 	    @cart.add_product(params)
	     
# 	    if @cart.save
# 	      redirect_to cart_path
# 	    else
# 	      flash[:error] = 'There was a problem adding this item to your cart.'
# 	      redirect_to @product
# 	    end
# 	  end

# 	  def destroy
# 	    @cart_products.destroy
# 	    redirect_to cart_path
# 	  end
# end
class CartProductsController < ApplicationController
    before_action :set_cart_product, only: [:show, :edit, :update, :destroy]
 
    # GET /line_items
    # GET /line_items.json
    def index
        @cart_products = CartProduct.all
    end
 
    # GET /line_items/1
    # GET /line_items/1.json
    def show 

    end
 
    # GET /line_items/new
    def new   
        @cart_product = CartProduct.new
    end
 
    # GET /line_items/1/edit
    def edit
    end
 
    # POST /line_items
    # POST /line_items.json
    def create   
        @cart = current_cart
        product = Product.find(params[:product_id])
	    # @cart.cart_products.each do |item|
		    # if ((item.product_id != params[:product_id].to_i) || ((item.product_id == params[:product_id].to_i) && (item.size != params[:addcart][:size].to_i)))		
			        @cart_product = CartProduct.new
			        @cart_product.product_id = product.id
			        @cart_product.size = params[:addcart][:size]
			        @cart_product.quantity = params[:addcart][:quantity]
			        @cart_product.cart_id = @cart.id
			        @cart_product.price = product.price
		    	# else
		    		# @cart_product = CartProduct.find(item)
		    		# item.quantity = item.quantity + params[:addcart][:quantity].to_i
		    		# @cart_product.quantity = @cart_product.quantity + params[:addcart][:quantity].to_i
		    	# end
		    # end
	
       
            if @cart_product.save
                redirect_to cart_path(@cart)
            else
                redirect_to root_path
            end
        
    end
 
    # PATCH/PUT /line_items/1
    # PATCH/PUT /line_items/1.json
    def update
        respond_to do |format|
            if @cart_product.update(line_item_params)
                format.html { redirect_to @cart_product, notice: 'Line item was successfully updated.' }
                format.json { render :show, status: :ok, location: @cart_product }
            else
                format.html { render :edit }
                format.json { render json: @cart_product.errors, status: :unprocessable_entity }
            end
        end
    end
 
    # DELETE /line_items/1
    # DELETE /line_items/1.json
    def destroy
        @cart_product.destroy
        respond_to do |format|
            format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
           format.json { head :no_content }
        end
    end
 
private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_product
        @cart_product = CartProduct.find(params[:id])
    end
 
# Never trust parameters from the scary internet, only allow the white list through.
    def cart_product_params
        params.require(:cart_product).permit(:product_id, :cart_id)
    end
end