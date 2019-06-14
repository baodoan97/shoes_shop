class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  require 'roo'

  def paymentdetail
    @payment_items = PaymentItem.find_by(payment_id: params[:payment][:payment_id])
  end

  def transport_cost
    @ship = TransportCost.all.find(params[:info][:id])
  end

  def new
    if TransportCost.all.count == 0 #TransportCost.all is nil , using file on cloud amazon
      s3 = AmazonS3Helper.s3
      obj= s3.bucket('doanshoes').object('list63provinces.xlsx')
      obj.get(response_target: Rails.root.join("public/list63provinces.xlsx"))
      file = Rack::Test::UploadedFile.new(Rails.root.join("public/list63provinces.xlsx"))
      TransportCost.import(file)
      FileUtils.rm_f(Rails.root.join("public/list63provinces.xlsx"))
    end

    if  user_signed_in? == false ||  Cart.where(user_id: current_user.id).size == 0
      redirect_to '/', :notice =>  user_signed_in? == true ? 'Your cart is empty' : 'Login please!'
      return
    end
    @payment = Payment.new
  end

  def create
    # SendEmailJob.set(wait: 50.seconds).perform_later(current_user)
    if Cart.where(user_id: current_user.id).size == 0
      redirect_to '/', :notice => 'Your cart is empty'
      return
    else
      @payment = Payment.new(payment_params)
      @payment.user = current_user
      if payment_params[:address] != nil
        if params[:province][:province_id] != "" && TransportCost.all.find(params[:province][:province_id]) != nil
          @payment.transport_cost = TransportCost.all.find(params[:province][:province_id]).price
          @payment.province = TransportCost.all.find(params[:province][:province_id]).province
        else
          flash[:alert] = "Please! Choose province of your "
          render 'new'
          return
        end
        @location = nil
        @place = Place.new
        @place.name = payment_params[:address]
        begin
          @location = Geocoder.search(payment_params[:address]).first.coordinates
          @place.latitude = @location[0]
          @place.longitude = @location[1]
        rescue => ex
          @place.latitude = nil
          @place.longitude = nil
        end
       @payment.place = @place if @place.save
      end
      if(params[:payment][:pay_type] == "atm")
        Stripe.api_key = "sk_test_wdVv7Hk8YLpEDoSxmCiaxEyp00p5Be9Ide"
        # @cart = current_cartart
        @amount = Cart.where(user_id: current_user.id).sum{|item|item.price*item.quantity}.to_i * 100
        token = params[:stripeToken]
        # Create a Customer
        customer = Stripe::Customer.create({
                                             :description => params[:payment][:name],
                                             :card => token,
        })
        charge = Stripe::Charge.create({
                                         :customer => customer.id,
                                         :amount => @amount, # amount in cents, again
                                         :currency => 'usd'
        })
        @payment.charge_id = charge.id
        if @payment.save
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
      else
        if @payment.save
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
end
