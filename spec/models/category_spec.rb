require "rails_helper"

RSpec.describe Category, type: :model do 
	describe "relationships" do 
		it {should belong_to(:budget)}
		it {should have_many(:notifications)}
	end
	

end