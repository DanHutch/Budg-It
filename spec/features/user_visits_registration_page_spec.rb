require "rails_helper"

RSpec.describe "/register" do
	it "should have form to register" do 
		visit root_path

		click_on("Register")
		expect(current_path).to eq(registration_path)
		
		expect(page).to have_content("Register")
		expect(page).to have_field("user[name]")		
		expect(page).to have_field("user[phone]")		
		expect(page).to have_field("user[email]")		
	end
end