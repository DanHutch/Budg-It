require "rails_helper"

RSpec.describe Day, type: :model do 
	describe "relationships" do 
		it {should belong_to(:notification)}
	end
	

end