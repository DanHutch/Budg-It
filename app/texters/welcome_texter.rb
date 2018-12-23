class WelcomeTexter < Textris::Base
  default :from => ENV["TWILIO_NUMBER"]

  def welcome(user)
    @user = user
    text :to => @user.phone
  end
end
