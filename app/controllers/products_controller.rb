class ProductsController < ApplicationController

    before_action :set_product , only: [:show]
     def show

      
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