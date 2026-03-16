class UserMailer < ApplicationMailer
  default from: "araf_ceo_no_reply@tukitaki.com"

  def welcome_email(user)
    @user = user
    @login_url = "http://localhost:5173/login" 
    mail(to: @user.email, subject: "Welcome to Tukitaki")
  end

end
