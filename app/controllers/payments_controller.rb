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

  def find_ward
    @ward = District.find_by(district_id: params[:district_id]).wards.order(:ward_name)
    respond_to do |format|
      format.json { render json: @ward }
    end
  end

  def calc_shipping_fee
    @response = call_calc_fee_api(params[:district_id])
    respond_to do |format|
      format.json { render json: @response }
    end
  end

  def new
    checkallquantity_cart_user(current_user.id)
    if  user_signed_in? == false ||  Cart.where(user_id: current_user.id).size == 0
      redirect_to '/', :notice =>  user_signed_in? == true ? 'Your cart is empty' : 'You need to login to place order!'
      return
    end
    @district = nil
    @ward = nil
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
      @payment.user_id = current_user.id
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
          @response = create_order(params[:district], params[:ward],params[:payment][:name],@amount,params[:payment][:phone],params[:payment][:address])          
          @payment.total =@amount 
          @payment.order_id = @response['data']['OrderCode']
          @carts = Cart.where(user_id: current_user.id)
          @payment.add_line_items_from_cart(@carts,@payment.id)
          if params[:voucher] != ""
            @voucher.payment_id = @payment.id
            @voucher.save
          end
          @carts.destroy_all
          @payment.payment_items.each do |item|
            @product = Product.find(item.product_id).stocks.where(size: item.size).first
            @product.quantity = @product.quantity - item.quantity
            @product.save
            redirect_to root_path,:notice => 'Payment request success!!!'
          end
          @payment.save
        else
          render 'new'
        end
      else
        if @payment.save
          @response = create_order(params[:district],params[:ward],params[:payment][:name],0,params[:payment][:phone],params[:payment][:address])  
          if params[:voucher] != ""
            @voucher.payment_id = @payment.id
            @voucher.save
          end
          @payment.total = @amount 
          @payment.order_id = @response['data']['OrderCode']
          @carts = Cart.where(user_id: current_user.id)
          @payment.add_line_items_from_cart(@carts,@payment.id)
          @carts.destroy_all
          @payment.payment_items.each do |item|
            @product = Product.find(item.product_id).stocks.where(size: item.size).first
            @product.quantity = @product.quantity - item.quantity
            @product.save
            redirect_to root_path,:notice => 'Payment request success!!!'
          end
          @payment.save
        else
          render 'new'
        end
      end
    end
  end

  def api_webhook
    event = JSON.parse(request.body.read)
    if event['OrderCode']
      @payment = Payment.find_by(order_id: event['OrderCode'])
      case event['CurrentStatus']
        when "Picking"
          @payment.status = 1
        when "Delivered"
          @payment.status = 2
        when "Cancel"
          @payment.status = 3
      end
      @payment.save
    end
  end



  private
  def payment_params
    params.require(:payment).permit(:name, :phone, :address, :pay_type)
  end

  def create_order(district,ward, name, amount, phone, address)
    return HTTParty.post(
            'https://apiv3-test.ghn.vn/api/v1/apiv3/CreateOrder',
            body: {
              "token": "TokenStaging",
              "PaymentTypeID": 1,
              "FromDistrictID": 1461,
              "FromWardCode": "4576",
              "ToDistrictID": district.to_i,
              "ToWardCode": ward,
              "ClientContactName": "Geogre Doan",
              "ClientContactPhone": "0902424936",
              "ClientAddress": "956 Quang Trung",
              "CustomerName": name,
              "CustomerPhone": phone,
              "ShippingAddress": address,
              "NoteCode": "CHOXEMHANGKHONGTHU",
              "CoDAmount": amount.to_i,
              "ServiceID": 53321,
              "Weight": 1000,
              "Length": 5,
              "Width": 10,
              "Height": 10,
            }.to_json,

            headers: {
              'Accept' => 'application/json',
              'Content-Type' => 'application/json'
            }
          )
  end

  def call_calc_fee_api(district)
    return HTTParty.post(
      'https://apiv3-test.ghn.vn/api/v1/apiv3/CalculateFee',
      body: {
        "token": "TokenStaging",
          "Weight": 1000,
          "Length": 5,
          "Width": 10,
          "Height": 10,
          "FromDistrictID": 1461,
          "ToDistrictID": district.to_i,
          "ServiceID": 53321,
      }.to_json,

        headers: {
          'Accept' => 'application/json',
          'Content-Type' => 'application/json'
        }
    )
  end
end
