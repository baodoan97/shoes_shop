module ProductsHelper
	 def Find_related_products_session(carts,offset = 1)
	       @products = [] 
		     i = 0 
	       while i < carts.count do                    
             @products << covert_array( Product.find(carts[i]['product_id'].to_i).category.products.where.not(id: 1).where('price >= :price ',price: carts[i]['price'].to_f).where('price >= :price ',price: carts[i]['price'].to_f).limit(2).offset(offset))
             i = i + 1
	       end
	       @products
	 end

	 def Find_related_products_of_product(product,offset = 1)
         @products = covert_array(Product.find(product.id).category.products.where.not(id: product.id).where(customer: product.customer.to_s).where('price >= :price ',price: product.price.to_f).limit(10).offset(offset))
	 end

	 def Find_related_products_of_product_user(products,offset = 1)
         @products = [] 
         products.each do |product|
         @products << covert_array(Product.find(product['product_id']).category.products.where.not(id: product.product_id).where('price >= :price ',price: product.price.to_f).limit(1).offset(offset))
         end
         @products 	          
	 end

     private

     def covert_array(object)
          @products = [] 
		     i = 0 
	       while i < object.count do
             @products << object[i]
             i = i + 1
	       end
	       @products   
     end

end
