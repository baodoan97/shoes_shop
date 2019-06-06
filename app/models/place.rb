class Place < ApplicationRecord
	belongs_to :payment, optional: true
	belongs_to :category
end
