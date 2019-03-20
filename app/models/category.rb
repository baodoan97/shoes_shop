class Category < ApplicationRecord

	#associates
	has_many :products
	#validate
		validates :name, presence:true, length: {minimum: 3, maximum: 30}, uniqueness:true
		validates :description, presence:true, length: {minimum: 10, maximum: 200}, uniqueness:true
end


