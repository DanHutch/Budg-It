class SessionsController < ApplicationController

def new
	@user ||= User.new	
end

def create
	@user = current_user
	data = request.env["omniauth.auth"]	  
	@user.tokens.create(token: data["access_token"], refresh_token: data["refresh_token"])
	redirect_to dashboard_path
end

end