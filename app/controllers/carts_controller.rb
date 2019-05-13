class CartsController < ApplicationController
	CartProductsHelper
    # def show
    #   debugger
    # end
   before_action :check_cart, only: [:show]

    def destroy
          carts = session[:cart]
             i = 0
          	carts.map do |item|
			  if item['product_id'] == params[:product_id] && item['size'] =  params[:size]
               carts.delete_at(i)
			  end
			  i = i + 1
			end
			 session[:cart] = carts
			if carts.count == 0
			 session[:cart] = nil
			# render :js => "window.location = ''
			
           render js: "$('#countcart').html(<p>a</p>);"
			 end
    end
    def show
       	@cart = current_cart
    end
    def create
    	# debugger
    	if cookies[:temp_cart] == nil
         cookies[:temp_cart] = SecureRandom.hex(32)
         @cart = Cart.create(temp_cart: cookies[:temp_cart].to_s)
         @cart_product = CartProduct.new
         @cart_product.product_id = params[:product_id]
		     @cart_product.size = params[:addcart][:size]
		     @cart_product.quantity = params[:addcart][:quantity]
		     @cart_product.cart_id = @cart.id
		     @cart_product.price = params[:price]
		     @cart_product.temp_cart = cookies[:temp_cart].to_s
         @cart_product.save
         @cart.save
    	else
    		  @cart_product = CartProduct.all.find_by(temp_cart: cookies[:temp_cart].to_s)
    		    if  @cart_product == nil
	               cookies[:temp_cart] = SecureRandom.hex(32)
				         @cart = Cart.create(temp_cart: cookies[:temp_cart].to_s)
				         @cart_product = CartProduct.new
						     @cart_product.product_id = Product.find(params[:product_id])
						     @cart_product.size = params[:addcart][:size]
						     @cart_product.quantity = params[:addcart][:quantity]
						     @cart_product.cart_id = @cart.id
						     @cart_product.price = Product.find(params[:product_id]).price
						     @cart_product.temp_cart = cookies[:temp_cart].to_s
				         @cart_product.save
				         @cart.save
    		    else 
    		      	@cart_products = CartProduct.where(temp_cart: cookies[:temp_cart].to_s)
	             	@cart_products.each do |item|
		    		    if ((item.product_id != params[:product_id].to_i) || ((item.product_id == params[:product_id].to_i) && (item.size != params[:addcart][:size].to_i)) )		
		    		        debugger
		    		        @cart_product = CartProduct.new
		    		        @cart_product.product_id = Product.find(params[:product_id]).id
		    		        @cart_product.size = params[:addcart][:size]
		    		        @cart_product.quantity = params[:addcart][:quantity]
		    		        @cart_product.cart_id = Cart.find_by(temp_cart: cookies[:temp_cart].to_s).id
		    		        @cart_product.price = Product.find(params[:product_id]).price
		    		        @cart_product.temp_cart = cookies[:temp_cart].to_s
				            @cart_product.save
		    	    	else
		    	    		# debugger
		    	    	# 	# item.quantity = item.quantity + params[:addcart][:quantity].to_i
		              @cart_product = CartProduct.find(item.id)
		    	    		@cart_product.quantity = @cart_product.quantity + params[:addcart][:quantity].to_i
                  @cart_product.save
		    		    end
	    		     end
    	       end
        end

    end
    private
    def check_cart
         if cookies[:temp_cart] == nil
         	redirect_to root_path
         end
    end
end