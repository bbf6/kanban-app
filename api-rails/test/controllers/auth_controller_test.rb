require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  JWT_REGEX = /^[A-Za-z0-9\-_=]+\.[A-Za-z0-9\-_=]+\.?[A-Za-z0-9\-_.+\/=]*$/
  LOGIN_URL = '/api/auth/login'

  def setup
    alice = users(:alice)
    @body = { auth: { email: alice.email, password: PASSWORD } }
  end

  test 'should return a jwt token and user info when correct credentials are provided' do
    post LOGIN_URL, params: @body
    assert_response :accepted
    token = response.parsed_body[:token]
    assert JWT_REGEX.match? token
    assert response.parsed_body.key? :user
  end

  test 'should fail when no email param is provided' do
    @body[:auth].delete :email
    post LOGIN_URL, params: @body
    assert_response :unauthorized
  end

  test 'should fail when no password param is provided' do
    @body[:auth].delete :password
    post LOGIN_URL, params: @body
    assert_response :unauthorized
  end

  test 'should fail when a wrong email is provided' do
    @body[:auth][:email] = 'fake@mail.com'
    post LOGIN_URL, params: @body
    assert_response :unauthorized
  end

  test 'should fail when a wrong password is provided' do
    @body[:auth][:password] = 'wrongpa55word'
    post LOGIN_URL, params: @body
    assert_response :unauthorized
  end

  test 'should fail when a null email is provided' do
    @body[:auth][:email] = nil
    post LOGIN_URL, params: @body
    assert_response :unauthorized
  end

  test 'should fail when a null password is provided' do
    @body[:auth][:password] = nil
    post LOGIN_URL, params: @body
    assert_response :unauthorized
  end

  test 'should fail when an empty email is provided' do
    @body[:auth][:email] = ''
    post LOGIN_URL, params: @body
    assert_response :unauthorized
  end

  test 'should fail when an empty password is provided' do
    @body[:auth][:password] = ''
    post LOGIN_URL, params: @body
    assert_response :unauthorized
  end

  test 'should fail when no body is provided' do
    post LOGIN_URL
    assert_response :bad_request
  end
end
