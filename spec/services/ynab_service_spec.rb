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
			it "returns a hash" do
				key = ENV['YNAB_USER_TOKEN']
				VCR.use_cassette("vcr_service_spec") do
					service = YnabService.new(key)

					expect(service.get_uid).to be_a(String)
        end
      end
    end
  end
end