require "rails_helper"

RSpec.describe "/dashboard" do
	before(:each) do
		@user = User.create(name: "Dan Man", email: "fake@email.com", phone: "10234567890")
		@token = @user.tokens.create(token: "bstoken", refresh_token: "alsobs", uid: "f3f7bcfe-45fd-42d0-8274-4b70eec8c443")

		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

		stub_user_api_calls
		stub_budgets_api_calls
		category_data = stub_categories_api_calls
		stub_omniauth

		category_data = stub_snapshot_api_calls
		@category = JSON.parse(category_data.response.body)['data']['category']

		h = NumHelperMethods.new
		today = Date.today.day
		end_of_month = Date.today.end_of_month.day
		@daily = h.number_to_currency((@category['balance'] / (end_of_month - today)) / 1000)

		visit dashboard_path
	end

	it "should ask a user to choose which category to track" do
		expect(page).to have_content("#{@user.name}'s Dashboard")
		expect(page).to_not have_css(".category-data")
		expect(page).to have_content("Please Select Category to Track:")
	end

	describe 'after picking a category' do

		it 'should display the budgets name' do
			choose(:category, match: :first)
			click_on("Select Category")
			expect(current_path).to eq(dashboard_path)
			expect(page).to have_css(".category-data")
			expect(page).to have_content("Monthly #{@category['name']} Snapshot")
		end

		it 'should display the amount budgeted for the category' do
			choose(:category, match: :first)
			click_on("Select Category")
			expect(current_path).to eq(dashboard_path)
			expect(page).to have_content("Budgeted: $200.00")
		end

		it 'should display the amount spent' do
			choose(:category, match: :first)
			click_on("Select Category")
			expect(current_path).to eq(dashboard_path)
			expect(page).to have_content("Activity: $0.00")
		end

		it 'should display the amount remaingin' do
			choose(:category, match: :first)
			click_on("Select Category")
			expect(current_path).to eq(dashboard_path)
			expect(page).to have_content("Remaining Balance: $200.00")
		end

		it 'should display the amount left per day till end of month' do
			choose(:category, match: :first)
			click_on("Select Category")
			expect(current_path).to eq(dashboard_path)
			expect(page).to have_content("Daily Allotment: #{@daily} per day")
		end
	end
end
