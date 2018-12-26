require "rails_helper"

RSpec.describe "/logout" do
	it "should allow a user to logout" do

		user = User.create(name: "Dan Man", email: "fake@email.com", phone: "10234567890")
		token = user.tokens.create(token: "bstoken", refresh_token: "alsobs", uid: "f3f7bcfe-45fd-42d0-8274-4b70eec8c443")
		stub_user_api_calls
		stub_omniauth
		stub_budgets_api_calls
		stub_categories_api_calls
		visit login_path

		expect(page).to have_link("Login with YNAB")

		click_link("Login with YNAB")

		expect(current_path).to eq(dashboard_path)
		expect(page).to have_content("Dan Man's Dashboard")

		expect(page).to_not have_link("Log In")
		expect(page).to_not have_link("Register")
		expect(page).to have_link("Log Out")

		visit(root_path)
		expect(page).to_not have_link("Log In")
		expect(page).to_not have_link("Register")
		expect(page).to have_link("Log Out")
		expect(page).to have_link("My Dashboard")

		visit(dashboard_path)
		click_link("Log Out")
		expect(current_path).to eq(root_path)

		expect(page).to have_link("Log In")
		expect(page).to have_link("Register")
		expect(page).to_not have_link("Log Out")
	end
end