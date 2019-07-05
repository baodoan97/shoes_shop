class UsersController < ApplicationController
  
  before_action :authenticate_user!

  def show

  end
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path(@user)
    else
      render 'users/registrations/show'
    end
  end
  def update_password
    debugger
    @user = current_user
    if !@user.valid_password?(user_password_params[:current_password])
      flash[:danger] = "Current Password Is Wrong"
      render "edit"
    else
      if user_password_params[:password_confirmation] != user_password_params[:password]
        flash[:danger] = "Password Confirmation Is Not Match"
        render "edit"
      else 
        @user.update_with_password(user_password_params)
        if @user.save
          # Sign in the user by passing validation in case their password changed
          bypass_sign_in(@user)
          flash[:success] = "Change password was successfully"
          redirect_to users_profile_path(@user)
        end
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:phone, :address, :gender)
  end
  def user_password_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end
end