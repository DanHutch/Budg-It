class SessionsController < ApplicationController

def new
	@user ||= User.new	
end

def create
	data = request.env["omniauth.auth"]["credentials"]
	token_code = data["token"]
	if current_user
		@user = current_user
		token_entry = @user.tokens.new(token: token_code, refresh_token: data["refresh_token"])
		if token_entry.save
			uid = GetYnabUserData.get_it(@user)
			flash[:success] = "Successully Logged in through YNAB!"
			redirect_to dashboard_path
		else 
			flash[:failure] = "Something went wrong."
			redirect_to root_path
		end
	else
		user_id = GetYnabUserData.check_it(token_code)
		user = Token.find_by(uid: user_id).user
		session[:user_id] = user.id
		redirect_to dashboard_path
	end
end

private

end