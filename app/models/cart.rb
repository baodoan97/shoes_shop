class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :user

    def total_price
      cart_products.to_a.sum { |item| item.total_price}
    end
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
  
  def add_carts(carts,user_id)
    @checkcarts = Cart.where(user_id: user_id)
    if @checkcarts != nil || @checkcarts.count > 0
       i = 0 
       while i < carts.count do
          @checkcarts.map do |item|
            if (carts[i]['product_id'].to_i == item.product_id) && (carts[i]['size'].to_i != item.size)   
                  new_item = Cart.new
                  new_item.user = User.find(user_id)
                  new_item.product_id = carts[i]['product_id'].to_i
                  new_item.price = carts[i]['price'].to_f
                  new_item.size = carts[i]['size'].to_i
                  new_item.quantity = carts[i]['quantity'].to_i
                  new_item.save
            end
            if (carts[i]['product_id'].to_i == item.product_id) && (carts[i]['size'].to_i == item.size) 
                  @cart = Cart.find(item.id)
                  @cart.quantity = @cart.quantity + carts[i]['quantity'].to_i
                  @cart.save 
            end  
          end
          @checkpresent = Cart.where(user_id: user_id).where(product_id: carts[i]['product_id'].to_i).where(size: carts[i]['size'].to_i)   
          if @checkpresent.count == 0
                new_item = Cart.new
                new_item.user = User.find(user_id)
                new_item.product_id = carts[i]['product_id'].to_i
                new_item.price = carts[i]['price'].to_f
                new_item.size = carts[i]['size'].to_i
                new_item.quantity = carts[i]['quantity'].to_i
                new_item.save
          end
        i = i + 1
      end
    else
       i = 0 
       while i < carts.count do
          new_item = Cart.new
          new_item.user = User.find(user_id)
          new_item.product_id = carts[i]['product_id'].to_i
          new_item.price = carts[i]['price'].to_f
          new_item.size = carts[i]['size'].to_i
          new_item.quantity = carts[i]['quantity'].to_i
          new_item.save
       end
    end

end
end