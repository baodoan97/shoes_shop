
class CartProductsController < ApplicationController
    before_action :set_cart_product, only: [:show, :edit, :update, :destroy]
 
    def index
        @cart_products = CartProduct.all
    end
 
    def show 

    end
 
    def new   
        @cart_product = CartProduct.new
    end

    def edit
    end
 
    def create   
        @cart = current_cart
        product = Product.find(params[:product_id])
        if @cart.cart_products.present?
    	    @cart.cart_products.each do |item|
    		    if ((item.product_id != params[:product_id].to_i) || ((item.product_id == params[:product_id].to_i) && (item.size != params[:addcart][:size].to_i)) )		
    		        @cart_product = CartProduct.new
    		        @cart_product.product_id = product.id
    		        @cart_product.size = params[:addcart][:size]
    		        @cart_product.quantity = params[:addcart][:quantity]
    		        @cart_product.cart_id = @cart.id
    		        @cart_product.price = product.price
    	    	else
    	    	# 	# item.quantity = item.quantity + params[:addcart][:quantity].to_i
                    @cart_product = CartProduct.find(item.id)
    	    		@cart_product.quantity = @cart_product.quantity + params[:addcart][:quantity].to_i
    		    end
    	    end
        else
            @cart_product = CartProduct.new
            @cart_product.product_id = product.id
            @cart_product.size = params[:addcart][:size]
            @cart_product.quantity = params[:addcart][:quantity]
            @cart_product.cart_id = @cart.id
            @cart_product.price = product.price
        end
            if @cart_product.save
                redirect_to cart_path(@cart)
            else
                redirect_to root_path
            end
        
    end
 
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
 
    def destroy
        @cart_product.destroy
        redirect_to cart_path
    end
 
private
    def set_cart_product
        @cart_product = CartProduct.find(params[:id])
    end
 
    def cart_product_params
        params.require(:cart_product).permit(:product_id, :cart_id)
    end
end