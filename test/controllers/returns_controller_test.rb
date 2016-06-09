require 'test_helper'

class ReturnsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
