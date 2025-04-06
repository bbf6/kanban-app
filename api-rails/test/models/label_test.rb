require "test_helper"

class LabelTest < ActiveSupport::TestCase
  def setup
    @board = boards(:one)
    @color = colors(:one)
  end

  test 'can create a new label' do
    assert Label.create(name: 'Critical', color: @color, board: @board)
  end

  test 'cannot create a new label without a board' do
    label = Label.new(name: 'Critical', color: @color)
    assert_not label.valid?
  end

  test 'cannot create a new label without a color' do
    label = Label.new(name: 'Critical', board: @board)
    assert_not label.valid?
  end

  test 'can destroy an unasigned label' do
    assert Label.count == 3
    labels(:no_related_label).destroy
    assert Label.count == 2
  end

  test 'cannot destroy a label assigned to a task' do
    assert_raises(ActiveRecord::InvalidForeignKey) do
      labels(:one).destroy
    end
  end
end
