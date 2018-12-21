require "rails_helper"

RSpec.describe "/login" do
	it "should allow a user to login" do
		user = User.create(name: "Dan Man", email: "fake@email.com", phone: "10234567890")
		visit login_path	
		
		# expect(page).to have_link("Login with YNAB")
		
	end
end