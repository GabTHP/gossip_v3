require 'test_helper'

class ProfilControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get profil_view_url
    assert_response :success
  end

end
