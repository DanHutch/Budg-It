class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(ready_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to oauth_path
		else
			flash[:error] = 'Email already in use.'
			redirect_to registration_path
    end
	end

	def show
		@facade = DashboardFacade.new(current_user)
	end

	private

	def ready_params
		new_params = user_params
		raw_phone = new_params["phone"]
		new_phone = raw_phone.scan(/\d+/).join
		new_phone[0] == "1" ? new_phone[0] = "" : new_phone
		new_params["phone"] = new_phone unless new_phone.length != 10
		return new_params
	end

	def user_params
   params.require(:user).permit(:email, :name, :phone)
	end

end