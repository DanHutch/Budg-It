require "rails_helper"

RSpec.describe "/login" do
	it "should allow a user to login" do

		user = User.create(name: "Dan Man", email: "fake@email.com", phone: "10234567890")
		token = user.tokens.create(token: "bstoken", refresh_token: "alsobs", uid: "f3f7bcfe-45fd-42d0-8274-4b70eec8c443")
		stub_user_api_calls
		stub_omniauth
		visit login_path

		expect(page).to have_link("Login with YNAB")

		click_link("Login with YNAB")

		expect(current_path).to eq(dashboard_path)
		expect(page).to have_content("#{user.name}'s Dashboard")
	end
end