module OmniAuthUser

  def mock_omniauth_user
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      :provider => 'twitter',
      :uid => '123545',
      :info => { :nickname => 'twitter_mock_user',
      :image => "mock_user_thumbnail_url"},
      :credentials => { :token =>"222333444" }
    })
  end
end

