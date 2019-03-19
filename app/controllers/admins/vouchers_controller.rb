
class Admins::VouchersController < BaseController

    def index
       @vouchers = Voucher.all.order("id DESC").paginate(page: params[:vouchers_page], per_page: 5)
       @voucherss = Voucher.all.where("payment_id != ''").paginate(page: params[:voucherss_page], per_page: 5)
       @voucher = Voucher.new
    end

    def create
       @voucher = Voucher.new(voucher_params)
       if Voucher.all.find_by(code: @voucher.code)
         render js: "alert('Code was actived')";
       else
           @voucher.save
       end
 
    end

    private
    def voucher_params     
     params.require(:post).permit(:code, :percent)
    end
end