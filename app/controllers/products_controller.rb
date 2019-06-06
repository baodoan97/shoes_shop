class ProductsController < ApplicationController
    skip_before_action :verify_authenticity_token
    include ProductsHelper

    before_action :set_product , only: [:show]
    def index
      debugger
      if params[:search]
        @products = Product.search(params[:search]).paginate(page: params[:page], per_page: 8)
      else
        @products =  Product.all
      end
    end
    
    def show

      
    end

    def search
      @products = Product.search(params[:term]).order_by_name
      @product_hash = []
      @products.each do |p|
        @product_hash << { 
            label: p.name,
            value: p.name,
            id: p.id
        }
      end
      render json: @product_hash
    end


    def watched_more_related_products
        @Related_products = nil
        @product = Product.find(params[:info][:product_id])
        # if user_signed_in? == false && session[:cart] != nil && session[:cart].count >= 4
        #        @Related_products = Find_related_products_session(session[:cart],params[:info][:offset].to_i)
        # elsif (user_signed_in? == false && (session[:cart] == nil || session[:cart].count <= 3))
               @Related_products = Find_related_products_of_product(@product,params[:info][:offset].to_i)
        #  else
        #      if Cart.where(user_id: current_user.id).count <= 3
        # @Related_products = Find_related_products_of_product(@product,params[:info][:offset].to_i)
                # else
                #     @Related_products = Find_related_products_of_product_user(Cart.where(user_id: current_user.id),params[:info][:offset].to_i) 
                # end      
        # end
      
    end

    
	def set_product
        @Related_products = nil
        if Product.exists? id: params[:id] 
            @product = Product.find(params[:id])
            # if user_signed_in? == false && session[:cart] != nil && session[:cart].count >= 4
            #    @Related_products = Find_related_products_session(session[:cart])
            # elsif (user_signed_in? == false && (session[:cart] == nil || session[:cart].count <= 3))
            #    @Related_products = Find_related_products_of_product(@product)
            # else
            #     if Cart.where(user_id: current_user.id).count == 0 || Cart.where(user_id: current_user.id).count <= 3
                    @Related_products = Find_related_products_of_product(@product)
                # else
                #     @Related_products = Find_related_products_of_product_user(Cart.where(user_id: current_user.id)) 
                # end
            # end
        else
             redirect_to root_path
            flash[:danger] = "Product is not exist"
        end



    end 
end

