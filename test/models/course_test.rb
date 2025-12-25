require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "course attributes must not be empty" do
    course = Course.new
    assert course.invalid?
    assert course.errors[:title].any?
    assert course.errors[:description].any?
    assert course.errors[:price].any?
  end

  test "course price must be positive" do
    course = Course.new(title: "My Course", description: "yyy", price: -1)
    assert course.invalid?
    assert_equal ["must be greater than or equal to 0"], course.errors[:price]

    course.price = 0
    assert course.valid?

    course.price = 1
    assert course.valid?
  end

  test "course has many tasks" do
    course = courses(:one)
    assert_equal 2, course.tasks.size
  end

  test "course identifies user progress" do
    user = users(:user_one)
    course = courses(:one)
    # user_one has subscription to course one, but no completed tasks yet
    assert_equal 0, course.user_progress(user)
  end
end
