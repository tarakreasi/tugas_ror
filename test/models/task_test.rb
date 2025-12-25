require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "task should have next and previous tasks" do
    task1 = tasks(:one)
    task2 = tasks(:three) # position 2 for course one

    assert_equal task2, task1.next_task
    assert_nil task1.previous_task

    assert_equal task1, task2.previous_task
    assert_nil task2.next_task
  end
end
