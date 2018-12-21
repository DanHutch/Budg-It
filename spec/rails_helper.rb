require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'
require 'vcr'
require 'webmock/rspec'
require 'capybara/email/rspec'

VCR.configure do |config|
  config.ignore_localhost = true
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<YNAB_USER_TOKEN>") { ENV['YNAB_USER_TOKEN'] }
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

SimpleCov.start "rails" do
  add_filter "app/channels"
end

Shoulda::Matchers.configure do |config|
    config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!
end

def stub_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:ynab] = OmniAuth::AuthHash.new({"credentials"=>{"token"=>ENV['ACCESS_TOKEN'], "token_type"=>"Bearer", "expires_in"=>7200, "refresh_token"=>ENV['REFRESH_TOKEN'], "scope"=>"public", "created_at"=>1545264495}})
end

def stub_user_api_calls
  stub_request(:get, "https://api.youneedabudget.com/v1/user").
      to_return(body: File.read("./spec/fixtures/sample_user_lookup_response.json"))
end
