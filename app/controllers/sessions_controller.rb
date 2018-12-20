class SessionsController < ApplicationController

def new
	@user ||= User.new	
end

def create
	@user = current_user
	data = request.env["omniauth.auth"]	  
	token = @user.tokens.new(token: data["credentials"]["token"], refresh_token: data["credentials"]["refresh_token"])
	if token.save
		flash[:success] = "Successully Logged in through YNAB!"
		redirect_to dashboard_path
	else 
		flash[:failure] = "Something went wrong."
		redirect_to root_path
	end
end

end