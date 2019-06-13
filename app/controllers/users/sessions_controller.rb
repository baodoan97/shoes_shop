# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  layout 'layouts/user'
  # before_action :configure_sign_in_params, only: [:create]

  #include Accessible
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    if User.find_by(email: params[:user][:email]).confirmed? == false
      self.resource = resource_class.new(sign_in_params)
      clean_up_passwords(resource)
      yield resource if block_given?
      render 'new'
    else
      super
      if session[:cart] != nil
        @cart = Cart.create
        @cart.add_carts(session[:cart],current_user.id)
      end
      session[:cart] = nil
            # SendEmailJob.set(wait: 50.seconds).perform_later(current_user)

    end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
