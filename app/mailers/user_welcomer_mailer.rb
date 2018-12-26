class UserWelcomerMailer < ApplicationMailer
  def welcome(user)
    @user = user
    mail(to: user.email, subject: "#{user.name}, Welcome to Budg-It!")
  end
end
