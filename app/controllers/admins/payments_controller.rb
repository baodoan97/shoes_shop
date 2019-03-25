class Admins::PaymentsController < BaseController
   
   def index

       @payments = Payment.all.order("id DESC").paginate(page: params[:payments_noprocess_page], per_page: 10)

   end

   def changestatus
        @payment = Payment.find(params[:payment][:id].to_i)
        @payment.status = params[:payment][:status].to_i
        @payment.save

   end 

end