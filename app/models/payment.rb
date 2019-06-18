class Payment < ApplicationRecord

    validates :name, presence:true, length: {minimum: 10, maximum: 50}
    validates :phone, :presence => {:message => 'Phone errors'},
                    :numericality => true,
                    :length => { :minimum => 9, :maximum => 11 }
    validates :address, presence:true, length: {minimum: 25, maximum: 150}

    belongs_to :user
    has_one  :place
    has_one :voucher
	has_many :payment_items, :dependent => :destroy
	has_many :products, through: :payment_item
	accepts_nested_attributes_for :payment_items
 validates :name, :address, :phone, :pay_type, :presence => true
 enum pay_type: {
 	cod: 1,
 	atm: 2
 }

 enum status: {
        in_progress: 0,
        shipping: 1,
        complete: 2,
        cancel: 3
    }
    def add_line_items_from_cart(cart,payment_id) 
        cart.each do |item|
            payment_item = PaymentItem.new(
            	:product_id => item.product_id,
            	:price => item.price,
            	:size => item.size,
            	:quantity => item.quantity,
            	:payment_id => payment_id
            	)
            payment_item.save
        end
    end
     def total_price
      payment_items.to_a.sum { |item| item.total_price}
    end
end