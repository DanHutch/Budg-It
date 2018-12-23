class UserTexter < Textris::Base
  default :from => "+19159743545"

  def welcome(user)
    @user = user
    # binding.pry
    text :to => '+1'+@user.phone
  end
end
