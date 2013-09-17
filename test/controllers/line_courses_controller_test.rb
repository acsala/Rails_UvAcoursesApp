require 'test_helper'

class LineCoursesControllerTest < ActionController::TestCase
  setup do
    @line_course = line_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_course" do
    assert_difference('LineCourse.count') do
      post :create, line_course: { cart_id: @line_course.cart_id, course_id: @line_course.course_id }
    end

    assert_redirected_to line_course_path(assigns(:line_course))
  end

  test "should show line_course" do
    get :show, id: @line_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_course
    assert_response :success
  end

  test "should update line_course" do
    patch :update, id: @line_course, line_course: { cart_id: @line_course.cart_id, course_id: @line_course.course_id }
    assert_redirected_to line_course_path(assigns(:line_course))
  end

  test "should destroy line_course" do
    assert_difference('LineCourse.count', -1) do
      delete :destroy, id: @line_course
    end

    assert_redirected_to line_courses_path
  end
end
