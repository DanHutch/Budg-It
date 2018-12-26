require "rails_helper"

RSpec.describe User, type: :model do

	describe "relationships" do
		it {should have_many(:tokens)}
		it {should have_many(:categories)}
	end

	describe "validations" do
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:phone)}
		it {should validate_presence_of(:email)}
		it {should validate_uniqueness_of(:email)}
	end

	describe "instance methods" do
		it "#tracked_category" do
			name = "That Guy"
			phone = "3213435645"
			email = "thatguys@email.com"

			user = User.create(name: name, phone: phone, email: email)

			cat_1 = user.categories.create(ynab_cid: "123453adgsdgf", name: "untracked 1", budget_id:"budget1id", tracked: false)
			cat_2 = user.categories.create(ynab_cid: "12fdagdfshadgsdgf", name: "untracked 2", budget_id:"budget1id", tracked: false)
			cat_3 = user.categories.create(ynab_cid: "fdaslkjdg43q", name: "tracked 3", budget_id:"budget1id", tracked: true)

			expect(user.tracked_category).to eq(cat_3)
		end
	end

end