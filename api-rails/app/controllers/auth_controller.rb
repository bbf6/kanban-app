class AuthController < ApplicationController
  include UserSerializer

  skip_before_action :authorized

  def login
    @user = User.find_by_email login_params[:email]
    return send_invalid unless @user
    return send_invalid unless @user.authenticate login_params[:password]
    send_accepted
  end

  private

  INVALID_MESSAGE = 'Incorrect email or password'

  def login_params
    params.require(:auth).permit(:email, :password)
  end

  def token
    encode(user_id: @user.id)
  end

  def send_accepted
    render json: { user: serialize(@user), token: token }, status: :accepted
  end

  def send_invalid
    render json: { message: INVALID_MESSAGE }, status: :unauthorized
  end
end
