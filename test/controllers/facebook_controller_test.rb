require 'test_helper'

class FacebookControllerTest < ActionDispatch::IntegrationTest
  test "should get uploadImg" do
    get facebook_uploadImg_url
    assert_response :success
  end

end
