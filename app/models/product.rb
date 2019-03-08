class Product < ApplicationRecord
	#associate

	has_many_attached :images
	belongs_to :category

	#validates
	validates :name, presence: true, uniqueness: true, length: {maximum: 40}
	validates :description, presence:true, length: {maximum: 100}
end