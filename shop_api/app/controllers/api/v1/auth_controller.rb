class Api::V1::AuthController < ApplicationController

  def signup
    user = User.new(user_params)
    if user.save
      token = encode_jwt(user.id)
      render_success({ token: token, email: user.email }, :created)
    else
      render_error(user.errors.full_messages)
    end
  end

  def login
    user = User.find_for_database_authentication(email: params[:email])
    if user&.valid_password?(params[:password])
      token = encode_jwt(user.id)
      render_success({email: user.email, token: token, })
    else
      render_error("Invalid Email or Password", :unauthorized)
    end
  end

  private
  def encode_jwt(user_id)
    payload = {user_id: user_id, exp: 24.hours.from_now.to_i}
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
