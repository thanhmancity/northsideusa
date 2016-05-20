require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get whoweare" do
    get :whoweare
    assert_response :success
  end

  test "should get brandpromise" do
    get :brandpromise
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

end
