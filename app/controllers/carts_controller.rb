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
       
    end
    def create
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
    private
    def check_cart
         if session[:cart] == nil
         	redirect_to root_path
         end
    end
end