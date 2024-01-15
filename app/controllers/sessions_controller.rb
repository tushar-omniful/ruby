class SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user&.valid_password?(params[:password])
      render json: user.as_json(only: [:id, :email]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy

  end
end