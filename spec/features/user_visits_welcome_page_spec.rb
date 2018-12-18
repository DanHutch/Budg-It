require "rails_helper"

RSpec.describe "/welcome" do
	it "should have links to register and log in" do 
		visit root_path

		expect(page).to have_link("Register")
		expect(page).to have_link("Log In")

		
	end
end