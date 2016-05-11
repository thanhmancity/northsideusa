require 'test_helper'

class ProductdetailControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
