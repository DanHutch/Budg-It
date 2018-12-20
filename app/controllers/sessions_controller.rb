class SessionsController < ApplicationController

def new
	@user ||= User.new	
end

def create
	@user = current_user
	data = request.env["omniauth.auth"]	  
	token = @user.tokens.create(token: data["access_token"], refresh_token: data["refresh_token"])
	if token.save
		puts "This Token Saved!"
		puts "#{request.env["omniauth.auth"]}"
		redirect_to dashboard_path
	else 
		puts "Token Not Saved"
		puts "#{request.env["omniauth.auth"]}"
	end
end

end