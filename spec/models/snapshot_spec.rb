require 'rails_helper'

RSpec.describe Snapshot, type: :model do

	describe "attributes" do
		it "should be held in state" do

			data = {
				:id=>"38e51ae5-519e-4c08-8f6b-2c74d5e58c38",
 				:category_group_id=>"4efd27b3-7a4e-4acf-be23-68ace02bf7a5",
 				:name=>"Food",
 				:hidden=>false,
 				:original_category_group_id=>nil,
				:note=>nil,
				:budgeted=>200000,
				:activity=>0,
				:balance=>200000,
				:goal_type=>nil,
				:goal_creation_month=>nil,
				:goal_target=>0,
				:goal_target_month=>nil,
				:goal_percentage_complete=>0,
				:deleted=>false
			}

			today = Date.today.day
			end_of_month = Date.today.end_of_month.day
			daily = (data[:balance].to_f / (end_of_month - today)) / 1000

			snap = Snapshot.new(data)
			expect(snap).to be_a(Snapshot)
			expect(snap.budgeted).to eq(data[:budgeted].to_f / 1000)
			expect(snap.spent).to eq(data[:activity].to_f / 1000)
			expect(snap.remaining).to eq(data[:balance].to_f / 1000)
			expect(snap.daily_allotment).to eq(daily)
		end
	end


end
