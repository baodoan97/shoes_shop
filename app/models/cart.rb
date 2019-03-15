class Cart < ApplicationRecord

	# def add_product(product_params)
 #    current_item = cart_products.find_by(product_id: product_params[:product][:product_id])
 #    if current_item
 #      current_item.quantity += product_params[:product][:quantity].to_i
 #    current_item.save
 #    else
 #    new_item = cart_products.create(product_id: product_params[:product][:product_id],
 #      quantity: product_params[:product][:quantity],
 #      cart_id: self.id)
 #    end
 #    new_item
 #  end
    has_many :cart_products, :dependent => :destroy
    def total_price
      cart_products.to_a.sum { |item| item.total_price}
    end
  # def add_carts(carts,user_id)
  #   # debugger
  #   # carts.each do |k,cart| 
   
  #   # end
  #   i = 0 
  #   while i < carts.count do
  #     new_item = Cart.new
  #     new_item.user_id = user_id
  #     new_item.product_id = carts[i]['product_id'].to_i
  #     new_item.price = carts[i]['price'].to_f
  #     new_item.size = carts[i]['size'].to_i
  #     new_item.quantity = carts[i]['quantity'].to_i
  #     new_item.save
  #     i = i + 1
  #   end
  # end

# =
# = =
# ===
end