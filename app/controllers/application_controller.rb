class ApplicationController < ActionController::Base
  include CartProductsHelper
  helper_method :related_product_from_cart,:get_carts,:update_status_model

  protect_from_forgery with: :exception
  def get_carts
  	@get_carts = nil
    if user_signed_in?
      @get_carts = Cart.where(user_id: current_user.id).to_a
    else
      @get_carts = session[:cart]
    end
    @get_carts
  end

  def related_product_from_cart
    @related_product ||= analysis_cart(get_carts).flatten if get_carts
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
