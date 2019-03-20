class Payment < ApplicationRecord
    has_one  :voucher
	has_many :payment_items, :dependent => :destroy
	has_many :products, through: :payment_item
	accepts_nested_attributes_for :payment_items
 validates :name, :address, :phone, :pay_type, :presence => true
 enum pay_type: {
 	cod: 1,
 	atm: 2,
 }
    def add_line_items_from_cart(cart) 
        cart.cart_products.each do |item|
            item[:cart_id] = nil
            payment_item = PaymentItem.new(
            	:product_id => item.product_id,
            	:price => item.price,
            	:size => item.size,
            	:quantity => item.quantity,
            	:payment_id => id
            	)
            payment_item.save
            payment_items << payment_item
        end
    end
     def total_price
      cart_products.to_a.sum { |item| item.total_price}
    end
end