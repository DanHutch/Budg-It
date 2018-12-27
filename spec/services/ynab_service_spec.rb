require 'rails_helper'

describe YnabService do

	it "exists" do

		VCR.use_cassette("vcr_service_spec") do

			service = YnabService.new("fake token")

			expect(service).to be_a(YnabService)
		end
  end

	context "instance methods" do

    context "#get_uid" do
			it "returns a user's data" do
				key = ENV['YNAB_USER_TOKEN']
				VCR.use_cassette("vcr_service_spec") do
					service = YnabService.new(key)

					expect(service.get_uid).to be_a(String)
        end
      end
		end

		context "#get_default_budget" do
			it "returns default budget info" do
				key = ENV['YNAB_USER_TOKEN']
				VCR.use_cassette("vcr_budgets_spec") do
					service = YnabService.new(key)

					expect(service.get_default_budget).to be_a(Hash)
					expect(service.get_default_budget[:id]).to be_a(String)
				end
			end
		end

		context "#get_categories" do
			it "returns categories info" do
				key = ENV['YNAB_USER_TOKEN']
				VCR.use_cassette("vcr_categories_spec") do
					service = YnabService.new(key)

					expect(service.get_categories()).to be_a(Array)

				end
			end
		end

		context "#get_snapshot" do
			it "returns snapshot of a single category" do
				user = User.create(name: "Dan Man", email: "fake@email.com", phone: "10234567890")
				cat = user.categories.create(ynab_cid: "38e51ae5-519e-4c08-8f6b-2c74d5e58c38", name: "Food", budget_id: "0f035ed8-1c2f-4a5d-b5ec-9570cc429d2d")

				allow_any_instance_of(YnabService).to receive(:snap_category).with(user).and_return(cat)
				key = ENV['YNAB_USER_TOKEN']
				VCR.use_cassette("vcr_snapshot_spec") do
					service = YnabService.new(key)

					expect(service.get_snapshot(user)).to be_a(Hash)
				end
			end
		end

  end
end