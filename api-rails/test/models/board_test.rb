require "test_helper"

class BoardTest < ActiveSupport::TestCase
  def setup()
    @default_background = backgrounds(:default_background)
    @background = backgrounds(:one)
    @company = companies(:one)
    @data = { name: 'team #2', company: @company, background: @background }
  end

  test 'can create a new board' do
    assert Board.create! @data
  end

  test 'cannot create a board without a name' do
    @data.delete :name
    board = Board.new @data
    assert_not board.valid?
  end

  test 'cannot create a board without a company' do
    @data.delete :company
    board = Board.new @data
    assert_not board.valid?
  end

  test 'can create a board without a background' do
    @data.delete :background
    assert Board.create! @data
  end

  test 'can give a background to a board but only if belongs to the same company or the background does not belongs to any board' do
    board = boards(:background_less_board)
    board.background = @default_background
    assert board.save!
  end

  test 'can destroy a board without caring for their relationcan destroy a board without caring for their relationss' do
    assert_difference 'Board.count', -1 do
      boards(:team1).destroy
    end
  end

  test 'can assign a user to a board' do
    board = boards(:team1)
    user = users(:alice)
    board.users.push user
    assert board.save!
  end
end
