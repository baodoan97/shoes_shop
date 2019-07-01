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
      if item.quantity > Product.find(item.product_id).stocks.where(size: item.size).first.quantity.to_i
        item.quantity = Product.find(item.product_id).stocks.where(size: item.size).first.quantity.to_i
        item.save
      end
    end
  end

  def checkallquantity_cart_session(carts)
    i = 0
    while i < carts.count do
        if Product.find(carts[i]['product_id'].to_i).stocks.where(size: carts[i]['size'].to_i).count == 0 || (Product.find(carts[i]['product_id'].to_i).stocks.where(size: carts[i]['size'].to_i).count != 0 && Product.find(carts[i]['product_id'].to_i).stocks.where(size: carts[i]['size'].to_i).first.quantity == 0)
          carts.delete_at(i)
          i = i - 1
        end
        if carts[i]['quantity'].to_i > Product.find(carts[i]['product_id'].to_i).stocks.where(size: carts[i]['size'].to_i).first.quantity.to_i
            carts[i]['quantity'] = Product.find(carts[i]['product_id'].to_i).stocks.where(size: carts[i]['size'].to_i).first.quantity.to_i
        end
        # if carts[i]['quantity'].to_i < 0
        #   carts[i]['quantity'] = 1
        # end
        i = i + 1
      end
      carts
    end


    def analysis_cart(cart)
      @list_product = []
      cart.each do |product|
        @list_product << get_duplicate_flow_price(product)
        @list_product << get_related_flow_payment(product)
      end
      @list_product
    end



    private

    def get_duplicate_flow_price(product)
      @product = Product.find(product['product_id'].to_i)
      @flow_price = Category.find(@product.category_id).products.where('price <= ? && price >= ? && id != ?',@product.price + (@product.price/2).to_i ,(@product.price/2).to_i,@product.id).limit(2)
      @flow_price
    end


    def get_related_flow_payment(product)
      @product = Product.find(product['product_id'].to_i)
      @list = []
      PaymentItem.all.each do |item|
        begin
          @list.push(item) if Product.find(item.product_id).category_id == @product.category_id && Product.find(item.product_id).id != product['product_id'].to_i
        rescue Exception => e

        end
      end
      @product_bestseller =  @list.group_by(&:product_id).take(3)
      @product_bestseller =  @product_bestseller.sort_by {|_key, value| value}.to_h
      @product_bestseller =  @product_bestseller.reverse_each.to_h
      @list_bestseller_of_category = []
      @product_bestseller.each do |key,value|
        @list_bestseller_of_category << Product.find(key.to_i)
      end
      @list_bestseller_of_category
    end

  end
