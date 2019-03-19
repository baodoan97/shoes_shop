class Product < ApplicationRecord
	#associate
    
	has_many_attached :images
	belongs_to :category, optional: true
	has_many :cart_products
    before_destroy :check_if_has_line_item
  
private
  
    def check_if_has_line_item
        if cart_products.empty?
            return true
        else
            errors.add(:base, 'This product has a LineItem')
            return false
        end
    end
	#validates
	# validates :name, presence: true, uniqueness: true, length: {maximum: 40}
	# validates :description, presence:true, length: {maximum: 100}
end