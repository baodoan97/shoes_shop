class CartsController < ApplicationController
	CartProductsHelper
    # def show
    #   debugger
    # end

    # def destroy
    # 	@cart.destroy
    # end
    def create
    	carts = session[:cart]
    	# debugger
		if carts != nil
			update = carts.find {|x| x['product_id'] == params[:product_id] }
           if update != nil
           	update[:quantity] = update[:quantity].to_i + params[:addcart][:quantity].to_i
	            for i in 0..carts.count
                       if carts[i][:product_id] = params[:product_id]
                        carts[i] = update
                        break
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
	           	session[:cart] = carts
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