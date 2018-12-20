class SessionsController < ApplicationController

def new
	@user ||= User.new	
end

def create
	@user = current_user
	data = request.env["omniauth.auth"]	  
	token = @user.tokens.new(token: data["access_token"], refresh_token: data["refresh_token"])
	if token.save
		puts "This Token Saved!"
		puts "this is the data: #{data} END OF DATA"
		redirect_to dashboard_path
	else 
		puts "Token Not Saved"
		puts "this is the data: #{data} END OF DATA"		
		redirect_to root_path
	end
end

end