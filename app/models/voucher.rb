class Voucher < ApplicationRecord
	belongs_to :payment, optional: true
end