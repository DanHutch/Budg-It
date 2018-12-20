require "rails_helper"

RSpec.describe "user registration" do
	it "should create user with formatted phone number" do
		stub_omniauth
		visit root_path

		click_on("Register")

		fill_in "user[name]", with: "Dan Daman"
		fill_in "user[email]", with: "fake@email.com"
		fill_in "user[phone]", with: "1-333-543-4567"
		
		click_on("Register User")
		expect(User.last.name).to eq("Dan Daman")
		expect(User.last.email).to eq("fake@email.com")
		expect(User.last.phone).to eq("3335434567")

	end
end