class Admins::SessionsController < Devise::SessionsController
  # layout "layouts/admin"
  #include Accessible
  #skip_before_action :check_user, only: :destroy
  # before_action :configure_sign_in_params, only: [:create]
  #layout "adminshome"
  # GET /resource/sign_in
 
   def new
     super
   end

  # POST /resource/sign_in
   # def create
     # super
   #   #self.resource = warden.authenticate!(auth_options)
   #   #set_flash_message!(:notice, :signed_in)
   #   #yield resource if block_given?
   #  # redirect_to rails_admin_path()
   # end

  # DELETE /resource/sign_out
   def destroy
     super
   end

  # protected
  protected
  def after_sign_in_path_for(resource)
    admins_homepage_path()
  end
  def after_sign_out_path_for(resource)
    new_admin_session_path()
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
   
end