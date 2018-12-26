require "rails_helper"

RSpec.describe "/dashboard" do
	it "should display a user's category data from YNAB" do

		user = User.create(name: "Dan Man", email: "fake@email.com", phone: "10234567890")
		token = user.tokens.create(token: "bstoken", refresh_token: "alsobs", uid: "f3f7bcfe-45fd-42d0-8274-4b70eec8c443")

		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

		stub_user_api_calls
		stub_budgets_api_calls
		stub_omniauth
		visit dashboard_path

		expect(page).to have_content("#{user.name}'s Dashboard")

		expect(page).to have_css(".category-data")


	end
end