class Api::V0::UsersController < ApplicationController
  before_action :find_user, except: [:create]

  def create
    user = User.new user_params
    if user.save
      render json: user, serializer: UserSerializer, status: :created
    else
      render json: { errors: user.errors.messages }, status: :bad_request
    end
  end

  def show
    render json: @user, serializer: UserSerializer, status: :ok
  end

  def update
    if @user.update user_params
      render json: @user, serializer: UserSerializer, status: :ok
    else
      render json: { errors: @user.errors.messages }, status: :bad_request
    end
  end

  def destroy
    if @user.destroy
      render json: @user, serializer: UserSerializer, status: :ok
    else
      render json: { errors: @user.errors.messages }, status: :bad_request
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password)
  end

  def find_user
    @user = User.find_by!(id: params[:id])
  end
end
