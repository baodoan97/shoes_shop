# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    generic_callback("facebook")
  end

  def google_oauth2
    generic_callback( "google_oauth2" )
  end

  def generic_callback(provider)
    
    @identity = User.from_omniauth(request.env["omniauth.auth"])
    @user = @identity || current_user
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      if session[:cart] != nil
        @cart = Cart.create
        @cart.add_carts(session[:cart],current_user.id)
      end
      session[:cart] = nil
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
    else
      # session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_session_path, alert: "Email has already been taken, you must have another email. Please! "
    end
  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
