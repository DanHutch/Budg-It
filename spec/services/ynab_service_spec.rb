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

		context "#get_budgets" do
			it "returns budgets info" do
				key = ENV['YNAB_USER_TOKEN']
				VCR.use_cassette("vcr_budgets_spec") do
					service = YnabService.new(key)

					expect(service.get_budgets.first).to be_a(Hash)
					expect(service.get_budgets.first[:id]).to be_a(String)
				end
			end
		end

		context "#get_categories" do
			it "returns categories info" do
				key = ENV['YNAB_USER_TOKEN']
				VCR.use_cassette("vcr_categories_spec") do
					service = YnabService.new(key)

					expect(service.get_categories).to be_a(Array)

				end
			end
		end

  end
end