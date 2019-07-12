class Admins::PaymentsController < BaseController
   
   def index

       @payments = Payment.all.order("id DESC").paginate(page: params[:payments_noprocess_page], per_page: 10)

   end

   def changestatus
        @payment = Payment.find(params[:id])
        @status = @payment
        case @payment.status
        when "in_progress"
          @payment.status = 1
        when "shipping"
          @payment.status = 2
        end
        @payment.save
   end 

   def cancel_payment
   	if params[:id]
   		@payment = Payment.find(params[:id])
   		@payment.status = 3
      @payment.payment_items.each do |item|
        @product = Product.find(item.product_id).stocks.where(size: item.size).first
        @product.quantity = @product.quantity + item.quantity
        @product.save
      end  
   	end
   	if @payment.save
      if @payment.pay_type == "atm"
        Stripe.api_key = "sk_test_wdVv7Hk8YLpEDoSxmCiaxEyp00p5Be9Ide"
        re = Stripe::Refund.create({
          charge: @payment.charge_id,
          amount: @payment.total.to_i
        })
      end
   		respond_to do |format|
          format.js
      end
    end
   end

end