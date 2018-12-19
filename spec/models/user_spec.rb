require "rails_helper"

RSpec.describe User, type: :model do 

	describe "relationships" do 
		it {should have_many(:tokens)}
		it {should have_many(:budgets)}
	end

	describe "validations" do
		it {should validate_presence_of(:name)}
		it {should validate_presence_of(:phone)}
		it {should validate_presence_of(:email)}
		it {should validate_uniqueness_of(:email)}
	end
	
end