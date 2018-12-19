require "rails_helper"

RSpec.describe "/privacy" do
	it "should display the privacy policy" do 
		visit privacy_path

		expect(page).to have_content("Privacy Policy")

		expect(page).to have_content("Budg-It does not consume or collect private financial or account data. Budg-It takes all reasonable measures to ensure that API data from YNAB API is secure and protected. No private or confidential user financial data is stored on Budg-It's servers.")
	end
end