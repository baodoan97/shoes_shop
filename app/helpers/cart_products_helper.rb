module CartProductsHelper

  def self.add_cart(params_product)
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    @cart.add_product(params_product)
    @cart.save
  end

  def checkallquantity_cart_user(user_id)
    @cart = Cart.where(user_id: user_id)
    @cart.map do |item|
      if Product.find(item.product_id).stocks.where(size: item.size).count == 0 || (Product.find(item.product_id).stocks.where(size: item.size).count != 0 && Product.find(item.product_id).stocks.where(size: item.size).first.quantity == 0)
        item.destroy
      end
      if item.quantity < 0
        item.quantity = 1
        item.save
      end
    end
  end

  def checkallquantity_cart_session(carts)
    @products = carts
    i = 0
    while i < carts.count do
        if Product.find(carts[i]['product_id'].to_i).stocks.where(size: carts[i]['size'].to_i).count == 0 || (Product.find(carts[i]['product_id'].to_i).stocks.where(size: carts[i]['size'].to_i).count != 0 && Product.find(carts[i]['product_id'].to_i).stocks.where(size: carts[i]['size'].to_i).first.quantity == 0)
             carts.delete_at(i)
             i = i - 1
        end
        # if carts[i]['quantity'].to_i < 0
        #   carts[i]['quantity'] = 1
        # end
        i = i + 1
      end
      @products
    end

  end
