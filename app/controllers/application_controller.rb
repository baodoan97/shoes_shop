class ApplicationController < ActionController::Base
# before_action :set_cart

protect_from_forgery with: :exception
helper_method :get_carts
def get_carts
  @get_carts = session[:cart]
end

 # private
     
 #    def current_cart
 #        Cart.find(session[:cart_id])
 #    rescue ActiveRecord::RecordNotFound
 #        cart = Cart.create
 #        session[:cart_id] = cart.id
 #        cart
 #    end


# private
# 	# tao sessions cart
# 	def set_cart
# 		@cart = Cart.find(session[:cart_id])
# 	rescue ActiveRecord::RecordNotFound
# 		@cart = Cart.create
# 		session[:cart_id] = @cart.id
# 	end
# private
#   # override the devise helper to store the current location so we can
#   # redirect to it after loggin in or out. This override makes signing in
#   # and signing up work automatically.
#   def store_current_location
#     store_location_for(:admins, contact_path)
#   end
end