require "rails_helper"

RSpec.describe Day, type: :model do 

	describe "relationships" do 
		it {should belong_to(:notification)}
	end
	
	describe "validations" do
		it {should validate_presence_of(:notification_id)}
		it {should validate_presence_of(:day)}
	end
end