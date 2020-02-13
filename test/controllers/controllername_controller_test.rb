require 'test_helper'

class ControllernameControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get controllername_view_url
    assert_response :success
  end

end
