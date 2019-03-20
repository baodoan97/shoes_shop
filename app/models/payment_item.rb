class PaymentItem < ApplicationRecord
	belongs_to :payment
	belongs_to :product
	def total_price
		quantity * price
	end
end