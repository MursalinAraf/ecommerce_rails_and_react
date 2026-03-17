class Api::V1::AuthController < ApplicationController

  include CookieHandler

  def signup
    user = User.new(user_params)
    if user.save
      UserMailer.welcome_email(user).deliver_now
      access_token = TokenService.encode_access_token(user.id)
      refresh_token = TokenService.encode_refresh_token(user.id)
      set_refresh_cookie(refresh_token)
      render_success({ token: access_token, email: user.email }, :created)
    else
      render_error(user.errors.full_messages)
    end
  end

  def login
    user = User.find_for_database_authentication(email: params[:email])
    if user&.valid_password?(params[:password])
      access_token = TokenService.encode_access_token(user.id)
      refresh_token = TokenService.encode_refresh_token(user.id)
      set_refresh_cookie(refresh_token)
      render_success({email: user.email, token: access_token })
    else
      render_error("Invalid Email or Password", :unauthorized)
    end
  end

  def refresh
    refresh_token = cookies.encrypted[:refresh_token]

    return render json: { error: "No refresh token" }, status: :unauthorized unless refresh_token

    payload = TokenService.decode_token(refresh_token)

    return render json: { error: "Invalid refresh token" }, status: :unauthorized unless payload

    user = User.find_by(id: payload["user_id"])
    return render json: { error: "User not found" }, status: :unauthorized unless user

    new_access_token = TokenService.encode_access_token(user.id)

    render json: {
      token: new_access_token,
      email: user.email
    }
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
