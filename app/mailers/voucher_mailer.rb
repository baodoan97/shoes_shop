class VoucherMailer < ApplicationMailer
	  def gift_voucher(current_user)
	  	@user = User.find(current_user.id)
	    mail(to: @user.email, subject: 'Gift vouchers for customers')
	  end


end
