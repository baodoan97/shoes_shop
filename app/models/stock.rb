class Stock < ApplicationRecord
	belongs_to :product
	before_create :check_unique_size
	def check_unique_size
       if Product.find(self.product_id).stocks.find_by_size(self.size) != nil
       	self.destroy
           errors.add(:stocks, "have size #{self.size} present!!!")
           return false
       end
	end
end