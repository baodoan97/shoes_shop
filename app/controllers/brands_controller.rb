class BrandsController < ApplicationController
   before_action :set_brand, only: [:show]
  def show

  end
  private
	  def set_brand
	      @products = Brand.find(params[:id]).products
	  end
end
