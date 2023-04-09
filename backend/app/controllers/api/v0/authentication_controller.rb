class Api::V0::AuthenticationController < ApplicationController
  include JsonWebToken

  skip_before_action :check_headers, :decode_jwt, :authenticate_current_user, only: [:login]

  def login
    @user = User.find_by!(email: params[:email])

    if @user&.authenticate(params[:password])
      exp_time = ENV['TOKEN_EXP_TIME'] || 1
      time = Time.now + exp_time.minutes
      token = jwt_endcode({ user_id: @user.id }, time.to_i)
      render json: { token: token, exp: time.strftime('%d/%m/%Y %H:%M') }, status: :ok
    else
      render json: { errors: ['un autharized'] }, status: :unauthorized
    end
  end
end
