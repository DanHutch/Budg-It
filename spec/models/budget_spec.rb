require "rails_helper"

RSpec.describe Budget, type: :model do 
	describe "relationships" do 
		it {should belong_to(:user)}
		it {should have_many(:categories)}
	end
	

end