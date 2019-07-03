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
   	end
   	if @payment.save
   		respond_to do |format|
          format.js
      end
    end
   end

end