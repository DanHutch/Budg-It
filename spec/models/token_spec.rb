require "rails_helper"

RSpec.describe Token, type: :model do 

	describe "relationships" do 
		it {should belong_to(:user)}
	end

	describe "validations" do
		it {should validate_presence_of(:token)}
		it {should validate_presence_of(:user_id)}
		it {should validate_presence_of(:ynab_uid)}
	end
	

end