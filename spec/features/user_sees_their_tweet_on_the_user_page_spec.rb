require 'rails_helper'

RSpec.describe "logged in user" do 
  before(:each) do 
    OmniAuth.config.mock_auth[:twitter] = nil
  end

  xit "can log in and see one tweet" do 
    visit '/'
    mock_omniauth_user
    click_link "Who Am I"
    expect(page).to have_content("Holla! I'm awesome")
  end
end