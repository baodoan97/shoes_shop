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
    @list_news = []
    @news_related = NewsProduct.where(product_id: Product.find_by_name(params[:name]).id).order('created_at desc').limit(5)
    @news_related.each{ |n|
      if New.exists?(n['new_id'])
        @list_news.push(New.find(n.new_id))
      end
    }
    @list_news




  end

  def search
    @products = Product.search(params[:term]).order_by_name
    @product_hash = []
    @products.each do |p|
      @product_hash << {
        label: p.name,
        value: p.name,
        name: p.name
      }
    end
    render json: @product_hash
  end


  def watched_more_related_products
    @Related_products = nil
    @product = Product.find(params[:info][:product_id])
    @Related_products = Find_related_products_of_product(@product,params[:info][:offset].to_i)
  end


  def set_product
    @Related_products = nil
    if Product.exists? name: params[:name]
      @product= Product.find_by_name(params[:name])
      if @product.status != 'active'
        redirect_to root_path
        flash[:danger] = "Product is not exist"
      else
        @Related_products = Find_related_products_of_product(@product)
      end
    else
      redirect_to root_path
      flash[:danger] = "Product is not exist"
    end

  end
end
