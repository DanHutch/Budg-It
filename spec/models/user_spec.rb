require "rails_helper"

RSpec.describe User, type: :model do 
	describe "relationships" do 
		it {should have_many(:tokens)}
		it {should have_many(:budgets)}
	end
	

end