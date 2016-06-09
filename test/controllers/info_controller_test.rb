require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get termsofservice" do
    get :termsofservice
    assert_response :success
  end

  test "should get privacypolicy" do
    get :privacypolicy
    assert_response :success
  end

end
