require 'rails_helper'

RSpec.describe "logged in user" do 
  before(:each) do 
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  def user_logs_in
    visit '/'
    mock_omniauth_user
    click_link "Login with Twitter"
  end

  it "can see a tweet on user page" do 
    user_logs_in
    
    expect(page).to have_content("I tweeted this!")
  end
end