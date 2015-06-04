require 'rails_helper'

RSpec.describe "logged in user" do 
  before(:each) do 
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  it "can login with Twitter" do 
    visit '/'
    mock_omniauth_user
    click_link "Login with Twitter"
    expect(page).to have_content("twitter_mock_user")
  end
end

