class PaymentItem < ApplicationRecord
	belongs_to :payment
	belongs_to :product

end