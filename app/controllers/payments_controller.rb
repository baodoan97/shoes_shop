class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'roo'

  def paymentdetail
    @payment_items = PaymentItem.find_by(payment_id: params[:payment][:payment_id])
  end

  def find_district
    @district = Province.find_by(province_id: params[:province_id]).districts.order(:district_name)
    respond_to do |format|
      format.json { render json: @district }
    end
  end

  def calc_shipping_fee
    @response = call_calc_fee_api(params[:district_id])
    respond_to do |format|
      format.json { render json: @response }
    end
  end

  def new
    if  user_signed_in? == false ||  Cart.where(user_id: current_user.id).size == 0
      redirect_to '/', :notice =>  user_signed_in? == true ? 'Your cart is empty' : 'Login please!'
      return
    end
    @district = Province.find_by(province_name: 'An Giang').districts
    @province = Province.all
    @payment = Payment.new
  end

  def create
    debugger
    # SendEmailJob.set(wait: 50.seconds).perform_later(current_user)
    if Cart.where(user_id: current_user.id).size == 0
      redirect_to '/', :notice => 'Your cart is empty'
      return
    else
      @payment = Payment.new(payment_params)
      @payment.user = current_user
      @fee = call_calc_fee_api(params[:district])
      @fee = @fee['data']['CalculatedFee'].to_i
      @amount = Cart.where(user_id: current_user.id).sum{|item|item.price*item.quantity}.to_i
      if params[:voucher] != ""
        @voucher = Voucher.find_by(code: params[:voucher])
        @amount = @voucher.discounted_price(@amount) + @fee
      else
        @amount = @amount + @fee
      end
      
      
      
      if(params[:payment][:pay_type] == "atm")
        Stripe.api_key = "sk_test_wdVv7Hk8YLpEDoSxmCiaxEyp00p5Be9Ide"
        token = params[:stripeToken]
        customer = Stripe::Customer.create({
                                             :description => params[:payment][:name],
                                             :card => token,
        })
        charge = Stripe::Charge.create({
                                         :customer => customer.id,
                                         :amount => @amount, # amount in cents, again
                                         :currency => 'vnd'
        })
        @payment.charge_id = charge.id
        if @payment.save
          HTTParty.post(
            'https://apiv3-test.ghn.vn/api/v1/apiv3/CreateOrder',
            body: {
              "token": "TokenStaging",
              "PaymentTypeID": 1,
              "FromDistrictID": 1461,
              "ToDistrictID": params[:district].to_i,
              "ExternalCode": "",
              "ClientContactName": "Giao Hang Nhanh",
              "ClientContactPhone": "19001206",
              "ClientAddress": "70 Lữ Gia",
              "CustomerName": params[:payment][:name],
              "CustomerPhone": params[:payment][:phone],
              "ShippingAddress": params[:payment][:address],
              "NoteCode": "CHOXEMHANGKHONGTHU",
              "ServiceID": 53319,
              "Weight": 1000,
              "Length": 10,
              "Width": 10,
              "Height": 10,
            }.to_json,

            headers: {
              'Accept' => 'application/json',
              'Content-Type' => 'application/json'
            }
          )
          @carts = Cart.where(user_id: current_user.id)
          @payment.add_line_items_from_cart(@carts,@payment.id)
          if params[:voucher] != ""
            @voucher.payment_id = @payment.id
          end
          @carts.destroy_all
          @payment.payment_items.each do |item|
            @product = Product.find(item.product_id).stocks.where(size: item.size).first
            @product.quantity = @product.quantity - item.quantity
            @product.save
            redirect_to root_path,:notice => 'Payment request success!!!'
          end
        else
          render 'new'
        end
      else
        if @payment.save
          HTTParty.post(
            'https://apiv3-test.ghn.vn/api/v1/apiv3/CreateOrder',
            body: {
              "token": "TokenStaging",
              "PaymentTypeID": 1,
              "FromDistrictID": 1461,
              "ToDistrictID": params[:district].to_i,
              "ExternalCode": "",
              "ClientContactName": "Giao Hang Nhanh",
              "ClientContactPhone": "19001206",
              "ClientAddress": "70 Lữ Gia",
              "CustomerName": params[:payment][:name],
              "CustomerPhone": params[:payment][:phone],
              "ShippingAddress": params[:payment][:address],
              "NoteCode": "CHOXEMHANGKHONGTHU",
              "CoDAmount": @amount.to_i,
              "ServiceID": 53319,
              "Weight": 1000,
              "Length": 10,
              "Width": 10,
              "Height": 10,
            }.to_json,

            headers: {
              'Accept' => 'application/json',
              'Content-Type' => 'application/json'
            }
          )
          @payment.voucher = @voucher
          if params[:voucher] != ""
            @voucher.payment_id = @payment.id
          end
          @carts = Cart.where(user_id: current_user.id)
          @payment.add_line_items_from_cart(@carts,@payment.id)
          @carts.destroy_all
          @payment.payment_items.each do |item|
            @product = Product.find(item.product_id).stocks.where(size: item.size).first
            @product.quantity = @product.quantity - item.quantity
            @product.save
            redirect_to root_path,:notice => 'Payment request success!!!'
          end
        else
          render 'new'
        end
      end
    end
  end



  private
  def payment_params
    params.require(:payment).permit(:name, :phone, :address, :pay_type)
  end

  def call_calc_fee_api(district)
    return HTTParty.post(
      'https://apiv3-test.ghn.vn/api/v1/apiv3/CalculateFee',
      body: {
        "token": "TokenStaging",
          "Weight": 10000,
          "Length": 10,
          "Width": 10,
          "Height": 20,
          "FromDistrictID": 1461,
          "ToDistrictID": district.to_i,
          "ServiceID": 53319,
      }.to_json,

        headers: {
          'Accept' => 'application/json',
        'Content-Type' => 'application/json'
        }
    )
  end
end
