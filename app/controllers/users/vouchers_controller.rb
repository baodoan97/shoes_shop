class CouponsController < ApplicationController
  def validate
    voucher = Voucher.all.find_by(code: params[:code])
    if voucher.present?
      response = { valid: voucher.is_valid?, 
                   discounted_price: voucher.discounted_price(params[:price]) }
    else
      response = { valid: false, discounted_price: params[:price] }
    end
    respond_to do |format|
      format.json { render json: response }
    end
  end

end