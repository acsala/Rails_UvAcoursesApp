require 'test_helper'

class TakeCoursesControllerTest < ActionController::TestCase
  setup do
    @take_course = take_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:take_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create take_course" do
    assert_difference('TakeCourse.count') do
      post :create, take_course: { cart_id: @take_course.cart_id, course_id: @take_course.course_id }
    end

    assert_redirected_to take_course_path(assigns(:take_course))
  end

  test "should show take_course" do
    get :show, id: @take_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @take_course
    assert_response :success
  end

  test "should update take_course" do
    patch :update, id: @take_course, take_course: { cart_id: @take_course.cart_id, course_id: @take_course.course_id }
    assert_redirected_to take_course_path(assigns(:take_course))
  end

  test "should destroy take_course" do
    assert_difference('TakeCourse.count', -1) do
      delete :destroy, id: @take_course
    end

    assert_redirected_to take_courses_path
  end
end
