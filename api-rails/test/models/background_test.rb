require "test_helper"

class BackgroundTest < ActiveSupport::TestCase
  test 'can create a new background' do
    company = companies(:one)
    assert Background.create!(name: 'bubbles', company: company)
  end

  test 'cannot create a background without a name given' do
    company = companies(:one)
    background = Background.new(company: company)
    assert_not background.valid?
  end

  test 'can destroy a background' do
    background = backgrounds(:one)
    assert_difference 'Background.count', -1 do
      background.destroy
    end
  end
end
