class ApplicationController < ActionController::Base

	before_action :set_cart

	private
	# tao sessions cart
	def set_cart
		@cart = Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound
		@cart = Cart.create
		session[:cart_id] = @cart.id
	end



	# protect_from_forgery with: :exception
	# helper_method :current_user,:current_admin, :logged_in?
	
	# before_action :store_current_location, :unless => :devise_controller?
	# def current_user
	# 	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	# end

	# def logged_in?
	# 	!!current_user
	# end

	# def require_user
	# 	if !logged_in?
	# 		flash[:danger] ="You must be logged in to perform that action"
	# 		redirect_to root_path
	# 	end
	# end
	

# private
#   # override the devise helper to store the current location so we can
#   # redirect to it after loggin in or out. This override makes signing in
#   # and signing up work automatically.
#   def store_current_location
#     store_location_for(:admins, contact_path)
#   end

end