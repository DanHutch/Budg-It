class UserTexter < Textris::Base
  default :from => "+19159743545"

  def welcome(user)
    @user = user
    text :to => '+1'+@user.phone
  end
end
