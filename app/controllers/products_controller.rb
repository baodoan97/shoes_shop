class ProductsController < ApplicationController
    include ProductsHelper

    before_action :set_product , only: [:show]
     def show

      
    end

    
	def set_product
        @Related_products = nil
        if Product.exists? id: params[:id] 
            @product = Product.find(params[:id])
            if user_signed_in? == false && session[:cart] != nil
               @Related_products = Find_related_products_session(session[:cart])
            end

        else
            redirect_to root_path
            flash[:danger] = "Product is not exist"
        end     


    end 
end