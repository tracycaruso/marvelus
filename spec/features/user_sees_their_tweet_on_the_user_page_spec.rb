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

  def create_superhero
    Superhero.create(Superhero id: 1, deck: "Bruce Wayne, who witnessed the murder of his billi...", descripton: "good", gender: "1", name: "Batman", real_name: "Bruce Wayne", image: "http://static.comicvine.com/uploads/scale_medium/6...", birthday: "Feb 19, 1972", last_name: nil, publisher: "DC Comics", comic_vine_id: "1699", sentiment_score: -6)
  end

  it "can see a tweet on user page" do
    create_superhero
    user_logs_in

    expect(page).to have_content("I tweeted this!")
  end
end
