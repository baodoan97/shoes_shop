class Brand < ApplicationRecord
	validates :brand_name , presence: true
	validates :category_id , presence: true
	belongs_to :category
	has_many :products
end
