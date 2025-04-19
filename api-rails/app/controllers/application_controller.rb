class ApplicationController < ActionController::Base
  include JwtEncrypt

  before_action :authorized
  protect_from_forgery with: :null_session

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  def authorized
    return nil unless current_user
    render json: { message: 'You need to log in' }, status: :unauthorized
  end

  def not_found
    head :not_found
  end

  private

  def current_user
    token = decode
    return false unless token
    user_id = token[0]['user_id']
    @current_user = User.find user_id
  end
end
