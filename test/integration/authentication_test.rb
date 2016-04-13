require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  def mock_mah_auth(name, uid)
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      'provider'    => 'twitter',
      'uid'         => uid,
      'info'        => {'name' => name},
      'credentials' => {'token' => 'test-token', 'secret' => 'test-secret'}
    })
  end

  def assert_signed_out
    assert page.has_content?("Sign In")
    refute page.has_content?("Sign Out")
  end

  def assert_signed_in
    assert page.has_content?("Sign Out")
    refute page.has_content?("Sign In")
  end

  def test_users_can_sign_in_with_twitter_for_the_first_time
    name = 'Josh'
    uid  = '123test-uid456'
    mock_mah_auth name, uid

    page.visit root_path

    # before signing in
    assert_signed_out
    assert_equal 0, User.count

    # after signing in, before signing out
    page.click_on 'Sign In'
    assert_signed_in
    assert_equal 1, User.count
    user = User.first
    assert_equal name, user.name
    assert_equal uid,  user.uid

    # after signing out
    page.click_on 'Sign Out'
    assert_signed_out
  end

  def test_users_can_sign_in_with_twitter_when_returning_to_the_site
    name = 'Josh'
    uid  = '123test-uid456'
    mock_mah_auth name, uid

    user = User.create! name: name, uid: uid
    page.visit root_path
    assert_signed_out
    page.click_on 'Sign In'
    assert_signed_in
    assert_equal 1, User.count
  end
end
