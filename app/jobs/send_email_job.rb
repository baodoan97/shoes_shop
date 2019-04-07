class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(current_user)
           VoucherMailer.gift_voucher(current_user).deliver_now
  end
end
