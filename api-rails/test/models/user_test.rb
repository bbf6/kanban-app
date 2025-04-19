require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup()
    @company = companies(:one)
    @incomplete_user_data = {
      name: 'Roberto',
      email: 'roberto@mail.com',
      password: PASSWORD,
      password_confirmation: PASSWORD,
      company: @company
    }
    optional_data = {
      last_name: 'Bolaño',
      nickname: 'Rober',
      company: @company
    }
    @full_user_data = @incomplete_user_data.merge optional_data
  end

  test 'can create a user' do
    assert User.create! @full_user_data
  end

  test 'can create a user with some missing data' do
    assert User.create! @incomplete_user_data
  end

  test 'when a user is created the password must be encrypted' do
    user = User.create! @incomplete_user_data
    assert user.password_digest != PASSWORD
  end

  test 'cannot create a user with a missing name' do
    @incomplete_user_data.delete :name
    user = User.new @incomplete_user_data
    assert_not user.valid?
  end

  test 'cannot create a user with an empty string as a name' do
    @incomplete_user_data[:name] = ''
    user = User.new @incomplete_user_data
    assert_not user.valid?
  end

  test 'cannot create a user without a password' do
    @incomplete_user_data.delete :password
    user = User.new @incomplete_user_data
    assert_not user.valid?
  end

  test 'cannot create a user without a valid password' do
    bad_password_1 = '123'
    bad_password_2 = '1234567890'
    bad_password_3 = '1234567890abc'
    bad_password_4 = '1234567890ABC'
    bad_password_5 = 'abcdefghijABC'
    @incomplete_user_data[:password] = bad_password_1
    @incomplete_user_data[:password_confirmation] = bad_password_1
    user = User.new @incomplete_user_data
    assert_not user.valid?
    @incomplete_user_data[:password] = bad_password_2
    @incomplete_user_data[:password_confirmation] = bad_password_2
    user = User.new @incomplete_user_data
    assert_not user.valid?
    @incomplete_user_data[:password] = bad_password_3
    @incomplete_user_data[:password_confirmation] = bad_password_3
    user = User.new @incomplete_user_data
    assert_not user.valid?
    @incomplete_user_data[:password] = bad_password_4
    @incomplete_user_data[:password_confirmation] = bad_password_4
    user = User.new @incomplete_user_data
    assert_not user.valid?
    @incomplete_user_data[:password] = bad_password_5
    @incomplete_user_data[:password_confirmation] = bad_password_5
    user = User.new @incomplete_user_data
    assert_not user.valid?
  end

  test 'cannot create a user without a valid password confirmation' do
    @incomplete_user_data[:password_confirmation] = PASSWORD.reverse
    user = User.new @incomplete_user_data
    assert_not user.valid?
  end

  test 'cannot create a user without a company' do
    @incomplete_user_data.delete :company
    user = User.new @incomplete_user_data
    assert_not user.valid?
  end

  test 'can destroy a user without caring for their related records' do
    assert_difference 'User.count', -1 do
      users(:alice).destroy
    end
  end

  test 'cannot create a user with an existing password' do
    user = User.new @full_user_data
    assert user.valid?
    assert user.save!
    user2 = User.new @full_user_data
    assert_not user2.valid?
  end
end
