class Api::V0::UsersController < ApplicationController
  def create
    user = User.new user_params
    if user.save
      render json: user, serializer: UserSerializer, status: :created
    else
      render json: { errors: user.errors.messages }, status: :bad_request
    end
  end

  def show; end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end
end
