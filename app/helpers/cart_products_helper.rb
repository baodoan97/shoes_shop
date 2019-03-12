module CartProductsHelper
	def self.add_cart(params_product)
		rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
        @cart.add_product(params_product)
        @cart.save
	end
end
