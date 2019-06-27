class Admins::VouchersController < BaseController

  def index
    @vouchers = Voucher.all.order("id DESC").paginate(page: params[:vouchers_page], per_page: 5)
    @voucherss = Voucher.all.where("payment_id != ''").paginate(page: params[:voucherss_page], per_page: 5)
  end

  def create
    debugger
    @number = params[:number].to_i
    (1..@number).each do |voucher|
      begin
        raw_string = SecureRandom.random_number( 2**80 ).to_s( 20 ).reverse
        long_code = raw_string.tr( '0123456789abcdefghij', '234679QWERTYUPADFGHX' )
        short_code = long_code[0..3] + '-' + long_code[4..7] + '-' + long_code[8..11]
      end while Voucher.all.find_by(code: short_code)
      @voucher = Voucher.new(
        code: short_code,
        expiration: params[:expiration],
        percent: params[:percent]
      )
      if @voucher.save
        respond_to do |format|
          format.js
        end
      else
        render js: "Coupon generate was error!"
      end
    end
  end

end
