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
		if carts != nil
			update = carts.find {|x| x['product_id'] == params[:product_id] && x['size'] == params[:addcart][:size] }
           if update != nil 
           	carts.map do |item|
			  if item['product_id'] == params[:product_id]
               item['quantity'] = params[:addcart][:quantity].to_i + update['quantity'].to_i 
               item['price'] =  item['quantity'].to_f * update['price'].to_f
               item['size']  =  update['size']
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