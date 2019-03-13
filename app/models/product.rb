class Product < ApplicationRecord
	#associate

	has_many_attached :images
	belongs_to :category, optional: true
	has_many :cart_products
	has_many :carts, through: :cart_products
	has_many :bills
	#validates
	# validates :name, presence: true, uniqueness: true, length: {maximum: 40}
	# validates :description, presence:true, length: {maximum: 100}
end