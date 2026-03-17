module CookieHandler
  def set_refresh_cookie(token)
    cookies.encrypted[:refresh_token] = {
      value: token,
      httponly: true,
      secure: Rails.env.production?,
      expires: 30.days.from_now
    }
  end
end