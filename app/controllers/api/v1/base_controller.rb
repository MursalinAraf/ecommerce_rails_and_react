class Api::V1::BaseController < ApplicationController
  before_action :authenticate_jwt!

  private

  def authenticate_jwt!
    header = request.headers['Authorization']

    if header.blank?
      render_error("Token Header not present", :unauthorized) and return
    end

    token = header.split(' ').last

    if token.blank?
      render_error("Token not present", :unauthorized)
    end

    begin
      decoded_user = JWT.decode(token, Rails.application.secret_key_base)[0]
      @current_user = User.find(decoded_user["user_id"])

    rescue JWT::ExpiredSignature
      render_error("Token expired", :unauthorized)
    rescue 
      render_error("Invalid Token", :unauthorized)
    end
  end

  def current_user
    @current_user
  end

end
