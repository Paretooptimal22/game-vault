class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = current_user
    @url  = 'http://google.com/'
    mail(to: @user.email, subject: 'Welcome to Game Vault')
  end
end
