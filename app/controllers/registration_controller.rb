class RegistrationController < ApplicationController
  def create
    @user = User.new(registration_params)
    if(@user.save)
      login @user
      render json: "User saved"
    else
      render json: "error in registration", status: :unprocessable_entity
    end
  end

  private
  def registrations_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end