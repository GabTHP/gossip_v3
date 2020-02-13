require 'test_helper'

class ViewControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get view_view_url
    assert_response :success
  end

end
