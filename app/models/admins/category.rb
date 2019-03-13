class Admins::Category < ApplicationRecord

	#associates
	has_many :products
	#validate
		validates :name, presence:true, length: {minimum: 3, maximum: 15}, uniqueness:true
end


