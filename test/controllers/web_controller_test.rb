require 'test_helper'

class WebControllerTest < ActionController::TestCase
  test "should get lucky" do
    get :lucky
    assert_response :success
  end

  test "should get admin" do
    get :admin
    assert_response :success
  end

  test "should get finish" do
    get :finish
    assert_response :success
  end

end
