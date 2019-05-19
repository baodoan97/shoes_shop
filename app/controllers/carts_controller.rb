class CartsController < ApplicationController
  skip_before_action :verify_authenticity_token
	CartProductsHelper
  before_action :check_cart, only: [:show]
    def changeqt 
    	@checkqt = 0
			@resetvalue = 0 
    	if user_signed_in? == true
	         @cartss = Cart.where(user_id: current_user.id).where(product_id: params[:item][:id]).where(size: params[:item][:size])         
	         if Product.find(@cartss.first.product_id).stocks.find_by(size: params[:item][:size]) == nil
	          	@checkqt = 2
	      	    @cartss.first.destroy                 
	         elsif (Product.find(@cartss.first.product_id).stocks.find_by(size: params[:item][:size]).quantity.to_i < params[:item][:qt].to_i)
	             @checkqt = 1 
	             @resetvalue = Product.find(@cartss.first.product_id).stocks.find_by(size: params[:item][:size]).quantity.to_i   
	         else
	         	  @cartss.first.quantity = params[:item][:qt]
	            @cartss.first.save  
	         end       	 
    	 else 	
          @cartss = get_carts
			   	i = 0
			   	while i < @cartss.count do 
			   		if @cartss[i]['product_id'] == params[:item][:id] && @cartss[i]['size'] == params[:item][:size] 		           
			          if Product.find(@cartss[i]['product_id']).stocks.find_by(size: params[:item][:size]) == nil
			                 @checkqt = 2
			                 @cartss.delete_at(i)
			          elsif (Product.find(@cartss[i]['product_id']).stocks.find_by(size: params[:item][:size]).quantity.to_i < params[:item][:qt].to_i)
			                 @checkqt = 1 
			                 @resetvalue = Product.find(@cartss[i]['product_id']).stocks.find_by(size: params[:item][:size]).quantity.to_i   
			          else	           	
			                 @cartss[i]['quantity'] = params[:item][:qt]
			          end
			   		end
			   		i = i + 1
			   	end
			   	@cartss = nil if @cartss.count == 0
			   	session[:cart] = @cartss
    	end
   
    end

    def destroycart
    	  if user_signed_in?  
           Cart.where(user_id: current_user.id).where(product_id: params[:item][:id]).where(size: params[:item][:size]).first.destroy
           if Cart.where(user_id: current_user.id).count == 0
           	redirect_to root_path
           end    
    	  else 
    	  	 @cartss = get_carts
		       	i = 0
		       	while i < @cartss.count do 
		       		if @cartss[i]['product_id'] == params[:item][:id] && @cartss[i]['size'] == params[:item][:size]
		              @cartss.delete_at(i)
		       		end
		       		i = i + 1
		       	end
		       	if @cartss.count == 0
		           session[:cart] = nil
		           redirect_to root_path
		        else
		        	 session[:cart] = @cartss
		       	end
    	  end
       	

        
       
			# render js: "alert(1);"
    end
    def show
       	# @cart = current_cart
    end
    def create
    	if user_signed_in? 
               @checkcarts = Cart.where(user_id: current_user.id) 
               @checkpresent = Cart.where(user_id: current_user.id).where(product_id: params[:product_id]).where(size: params[:addcart][:size])   
               if @checkcarts != nil && @checkcarts.count != 0
	             	  @checkcarts.each do |item|
				    		    if (item.product_id == params[:product_id].to_i) && (item.size != params[:addcart][:size].to_i)		      
					    		         @cart = Cart.new
									         @cart.product_id = Product.find(params[:product_id]).id
											     @cart.size = params[:addcart][:size]
											     @cart.quantity = params[:addcart][:quantity]
											     @cart.price =  Product.find(params[:product_id]).price
											     @cart.user = current_user
									         @cart.save
								    end
				    	    	if (item.product_id == params[:product_id].to_i) && (item.size == params[:addcart][:size].to_i)	
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
							     @cart.price =  Product.find(params[:product_id]).price
							     @cart.user = current_user
					         @cart.save
		            end
		            if @checkpresent.count == 0
                   @cart = Cart.new
					         @cart.product_id = Product.find(params[:product_id]).id
							     @cart.size = params[:addcart][:size]
							     @cart.quantity = params[:addcart][:quantity]
							     @cart.price =  Product.find(params[:product_id]).price
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
			               "price" =>  Product.find(params[:product_id]).price,
			               "size"  => params[:addcart][:size] ,
			               "quantity"  => params[:addcart][:quantity]
						}
			           	carts.push(cartsnew)
				   end
				else
					carts = []
					carts.push({
		               "product_id" => params[:product_id],
		               "price" =>  Product.find(params[:product_id]).price,
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
    	@carts = 0
    	 @total = 0
    	if user_signed_in? 
         @carts = Cart.where(user_id: current_user.id)
         if @carts.count == 0
         	redirect_to root_path
         else
	         @carts.each do |item|
	         @total = @total + (item["price"].to_i*item["quantity"].to_i)
	         end
         end
      else 
          if session[:cart] != nil
          	@carts = session[:cart]
          	i = 0
		       	while i < @carts.count do 
		       	 @total = @total + (@carts[i]["price"].to_i*@carts[i]["quantity"].to_i)
		       		i = i + 1
		       	end
          else
            redirect_to root_path
          end
      end
        
	       
      end
end