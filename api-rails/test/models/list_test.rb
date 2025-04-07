require "test_helper"

class ListTest < ActiveSupport::TestCase
  def setup()
    @user = users(:user_working_on_team1)
    @board = boards(:team1)
    @color = colors(:red)
    @data = { title: 'Done', index: 2, board: @board, color: @color }
  end

  test 'can create a list' do
    assert List.create! @data
  end

  test 'cannot create a list without a title given' do
    @data.delete :title
    list = List.new @data
    assert_not list.valid?
  end

  test 'cannot create a list without a board specified' do
    @data.delete :board
    list = List.new @data
    assert_not list.valid?
  end

  test 'cannot create a list without a color specified' do
    @data.delete :color
    list = List.new @data
    assert_not list.valid?
  end

  test 'cannot create a list without an index specified' do
    @data.delete :index
    list = List.new @data
    assert_not list.valid?
  end

  test 'can change the index of a list' do
    list = lists(:todo)
    list.index = 3
    assert list.save!
  end

  test 'can assign a user to the list' do
    list = lists(:todo)
    list.users.push @user
    assert list.save!
  end
end
