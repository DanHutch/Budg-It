require "rails_helper"

RSpec.describe "User Registration" do

  before(:each) do
    stub_user_api_calls
    stub_omniauth
    stub_budgets_api_calls
		stub_categories_api_calls
    clear_emails
    Textris::Base.deliveries.clear
    visit root_path

    click_on("Register")

    @name = "Dan Daman"
    @email = "fake@email.com"
    @phone = "1-333-543-4567"

    fill_in "user[name]", with: @name
    fill_in "user[email]", with: @email
    fill_in "user[phone]", with: @phone
    click_on("Register User")
  end

  it "They should be redirected to their dashboard" do

    expect(page).to have_content("#{@name}'s Dashboard")
    expect(current_path).to eq(dashboard_path)
  end

  describe "They should go through the YNAB oauth handshake" do

    it "and get an access token" do
      expect(User.last.tokens.last.token).to eq(ENV['ACCESS_TOKEN']) # Add to application.yml under test: flag
    end

    it "and get a refresh token" do
      expect(User.last.tokens.last.refresh_token).to eq(ENV['REFRESH_TOKEN']) # Add to application.yml under test: flag
    end
  end

  it "They should receive a welcome email" do
    open_email('fake@email.com')

    expect(current_email).to have_content("#{@name}, welcome to Budg-It")
  end

  it "They should receive a welcome text" do
    texts = Textris::Base.deliveries

    expect(texts).to_not be_empty
    expect(texts.last.content).to have_content("Welcome to Budg-It #{@name}!")
  end

end
