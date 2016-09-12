require 'test_helper'

class LocationControllerTest < ActionController::TestCase
  test "should get daum_api" do
    get :daum_api
    assert_response :success
  end

end
