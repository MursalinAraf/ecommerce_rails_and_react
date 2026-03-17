class TokenService
  def self.encode_access_token(user_id)
    payload = {user_id: user_id, exp: 15.minutes.from_now.to_i}
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def self.encode_refresh_token(user_id)
    payload = {user_id: user_id, exp: 30.days.from_now.to_i}
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def self.decode_token(token)
    decoded = JWT.decode(token, Rails.application.secret_key_base)[0]
    decoded
  rescue
    nil
  end

end
