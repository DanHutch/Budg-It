require "rails_helper"

RSpec.describe Notification, type: :model do 

	describe "relationships" do 
		it {should belong_to(:category)}
		it {should have_many(:days)}
	end

	describe "validations" do
		it {should validate_presence_of(:category_id)}
		it {should validate_presence_of(:time)}
	end
	

end