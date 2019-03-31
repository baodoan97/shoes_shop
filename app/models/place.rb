class Place < ApplicationRecord
	belongs_to :payment, optional: true
end
