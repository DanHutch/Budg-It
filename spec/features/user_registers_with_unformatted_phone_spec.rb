require "rails_helper"

RSpec.describe "user registration" do
	it "should create user with formatted phone number" do
		stub_user_api_calls
		stub_omniauth
		stub_budgets_api_calls
		stub_categories_api_calls
		visit root_path

		click_on("Register")

		fill_in "user[name]", with: "Dan Daman"
		fill_in "user[email]", with: "fake@email.com"
		fill_in "user[phone]", with: "1-333-543-4567"
		click_on("Register User")
		expect(User.last.name).to eq("Dan Daman")
		expect(User.last.email).to eq("fake@email.com")
		expect(User.last.phone).to eq("3335434567")

		expect(current_path).to eq(dashboard_path)
		expect(page).to have_content("Successully Logged in through YNAB!")
		expect(page).to have_content("Dan Daman's Dashboard")
		expect(User.last.tokens.last.uid).to be_a(String)
	end

	it "should not let a user register with an email that is already in use" do
		user = User.create(name: "Existing User", email: "inuse@email.com", phone: "303-333-3333")
		stub_omniauth
		visit root_path

		click_on("Register")

		fill_in "user[name]", with: "Dan Daman"
		fill_in "user[email]", with: "inuse@email.com"
		fill_in "user[phone]", with: "1-333-543-4567"
		click_on("Register User")
		expect(current_path).to eq(registration_path)
		expect(page).to have_content("Email already in use.")
	end

end
