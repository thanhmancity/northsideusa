require 'test_helper'

class OrderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get thankyou" do
    get :thankyou
    assert_response :success
  end

end
