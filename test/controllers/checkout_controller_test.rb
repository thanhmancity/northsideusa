require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "should get shipping" do
    get :shipping
    assert_response :success
  end

  test "should get billing" do
    get :billing
    assert_response :success
  end

  test "should get delivery" do
    get :delivery
    assert_response :success
  end

  test "should get payment" do
    get :payment
    assert_response :success
  end

end
