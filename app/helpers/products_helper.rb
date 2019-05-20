module ProductsHelper
	 def Find_related_products_session(carts,offset = 1)
	       @products = [] 
		     i = 0 
	       while i < carts.count do
	           item = Product.find(carts[i]['product_id'].to_i).category.products.where.not(id: 1).where('price >= :price ',price: carts[i]['price'].to_f).where('price >= :price ',price: carts[i]['price'].to_f).limit(2)
             @products << item
             i = i + 1
	       end
	       @products         
	 end

	 def Find_related_products_of_product(product,offset = 1)
         @products = Product.find(product.id).category.products.where.not(id: product.id).where('price >= :price ',price: product.price.to_f).limit(4).offset(offset)
	 end

	 def Find_related_products_of_product_user(product,offset = 1)
        @products = Product.find(product.id).category.products.where.not(id: product.id).where('price >= :price ',price: product.price.to_f).limit(4).offset(offset)
	 end


end
