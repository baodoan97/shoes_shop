class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(current_user)
  	    WelcomeMailer.welcome_send(current_user).deliver
           # VoucherMailer.gift_voucher(current_user).deliver_now
  end


end
