require "rails_helper"

RSpec.describe Category, type: :model do 

	describe "relationships" do 
		it {should belong_to(:budget)}
		it {should have_many(:notifications)}
	end

	describe "validations" do
		it {should validate_presence_of(:ynab_cid)}
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:budget_id)}
	end
	

end