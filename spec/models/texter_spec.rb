require 'rails_helper'

require "spec_helper"

RSpec.describe UserTexter do

  before(:each) do
    Textris::Base.deliveries.clear
  end

  xit "should send welcome texts" do
    Textris::Base.deliveries

    user = User.create(name: "Tom Hanks", email: "willsonwhereyou@bro.com", phone: "303-333-3333")

    UserTexter.welcome(user).deliver
    binding.pry
    ActionMailer::Base.deliveries.should_not be_empty
  end
end
