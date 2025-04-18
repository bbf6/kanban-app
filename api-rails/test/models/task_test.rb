require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup()
    @list = lists(:todo)
    @data = {
      title: 'The risk analysis is not acurate',
      content: 'Please fix it before the next Friday',
      estimate_date: Date.new + 3.days,
      limit_date: Date.new + 5.days,
      list: @list,
      index: 2
    }
  end

  test 'can create a new task' do
    assert Task.create! @data
  end

  test 'the description is auto filled with a resume of the content' do
    task = Task.create! @data
    assert task.valid?
    assert task.description == task.content.to_plain_text
  end

  test 'cannot create a task without a title' do
    @data.delete :title
    task = Task.new @data
    assert_not task.valid?
  end

  test 'cannot create a task without content' do
    @data.delete :content
    task = Task.new @data
    assert_not task.valid?
  end

  test 'cannot create a task without a list' do
    @data.delete :list
    task = Task.new @data
    assert_not task.valid?
  end

  test 'can create a task without specifing estimate_date neither limit_date' do
    @data.delete :estimate_date
    @data.delete :limit_date
    assert Task.create! @data
  end

  test 'can assign many labels to a task' do
    task = tasks(:one)
    task.save!
    assert task.errors.empty?
  end

  test 'can assign many users to a task' do
    task = tasks(:one)
    task.users.push users(:alice)
    task.save!
    assert task.errors.empty?
  end

  test 'can destroy a task' do
    task = tasks(:one)
    assert_difference 'Task.count', -1 do
      task.destroy
    end
  end
end
