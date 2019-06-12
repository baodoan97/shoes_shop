class Voucher < ApplicationRecord
	belongs_to :payment, optional: true
	def is_valid?
        (self.expiration.nil? || self.expiration >= Date.current)
  end

  def discounted_price(price)
  	price = if is_valid?
              price - (price * percent / 100)
            else
				      price
            end
  end
end