require "rails_helper"

RSpec.describe "/login" do
	it "should allow a user to login" do
		user = User.create(name: "Dan Man", email: "fake@email.com", phone: "10234567890")
		visit root_path

		click_on("Register")
		expect(current_path).to eq(registration_path)
		
		expect(page).to have_content("Register")
		expect(page).to have_field("user[name]")		
		expect(page).to have_field("user[phone]")		
		expect(page).to have_field("user[email]")		
	end
end