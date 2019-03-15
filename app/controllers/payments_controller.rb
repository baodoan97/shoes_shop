class PaymentsController < ApplicationController
	def new
		 if session[:cart_id] == nil

	    	redirect_to '/', :notice => 'Your cart is empty'
	     	return
		  end
        @payment = Payment.new
	end

	def create
		@payment = Payment.new(payment_params)
        if @payment.save
            @payment.add_line_items_from_cart(current_cart)
            Cart.destroy(session[:cart_id])
            session[:cart_id] = nil
            redirect_to root_path
        else
            render 'new'
        end
	end

    private
    def payment_params
      params.require(:payment).permit(:name, :phone, :address, :pay_type)
    end
end
