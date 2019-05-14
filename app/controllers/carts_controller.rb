class CartsController < ApplicationController
	skip_before_action :verify_authenticity_token
	CartProductsHelper
    # def show
    #   debugger
    # end
   before_action :check_cart, only: [:show]

    def destroycart
       carts = session[:cart]
       i = 0
       # debugger
       carts.map do |item|
					 if item['id'] ==  params[:item][:id]
					 	debugger
		               carts.delete_at(i)
					 end
			  i = i + 1
			  end
			     session[:cart] = carts
			  if carts.count == 0
			      session[:cart] = nil
            render js: "$('#countcart').html(<p>a</p>);"
			  end
			# render js: "alert(1);"
    end
    def show
       	# @cart = current_cart
    end
    def create
    	if user_signed_in?
                @checkcarts = Cart.where(user_id: current_user.id)
                debugger
               if @checkcarts != nil
		             	  @checkcarts.each do |item|
					    		    if ((item.product_id != params[:product_id].to_i) || ((item.product_id == params[:product_id].to_i) && (item.size != params[:addcart][:size].to_i)) )		
					    		      
					    		         @cart = Cart.new
									         @cart.product_id = Product.find(params[:product_id]).id
											     @cart.size = params[:addcart][:size]
											     @cart.quantity = params[:addcart][:quantity]
											     @cart.price = params[:price]
											     @cart.user = current_user
									         @cart.save
					    	    	else
					    	    		# debugger
					    	    	# 	# item.quantity = item.quantity + params[:addcart][:quantity].to_i
					              @cart = Cart.find(item.id)
					    	    		@cart.quantity = @cart.quantity + params[:addcart][:quantity].to_i
			                  @cart.save
					    		    end
	    		          end
	    		     else
					         @cart = Cart.new
					         @cart.product_id = Product.find(params[:product_id]).id
							     @cart.size = params[:addcart][:size]
							     @cart.quantity = params[:addcart][:quantity]
							     @cart.price = params[:price]
							     @cart.user = current_user
					         @cart.save
		            end
    	else
    	# debugger
		    carts = session[:cart]
				if carts != nil
					update = carts.find {|x| x['product_id'] == params[:product_id] && x['size'] == params[:addcart][:size] }
		           if update != nil 
		           	carts.map do |item|
					  if item['product_id'] == params[:product_id] &&  item['size'] == params[:addcart][:size]
		               item['quantity'] = params[:addcart][:quantity].to_i + update['quantity'].to_i 
					  end
					end
		           else
			           cartsnew = {
			               "product_id" => params[:product_id],
			               "price" => params[:price],
			               "size"  => params[:addcart][:size] ,
			               "quantity"  => params[:addcart][:quantity]
						}
			           	carts.push(cartsnew)
				   end
				else
					carts = []
					carts.push({
		               "product_id" => params[:product_id],
		               "price" => params[:price],
		               "size"  => params[:addcart][:size] ,
		               "quantity"  => params[:addcart][:quantity]
					})
				end
				session[:cart] = carts
				respond_to do |format|
				       	format.html 
				       	format.js
			  end
      end
    end
    private
    def check_cart
    	@carts = nil
    	if user_signed_in? 
         @carts = Cart.where(user_id: current_user.id)  
      else 
          if  session[:cart] != nil
          	@carts = get_carts
          else
            redirect_to root_path
          end
       end
         @total = 0
	       @carts.each do |item|
         @total = @total + (item.price.to_i*item.quantity.to_i)
      end
    end
end