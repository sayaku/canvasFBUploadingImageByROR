require 'test_helper'

class PhotoControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get photo_create_url
    assert_response :success
  end

  test "should get show" do
    get photo_show_url
    assert_response :success
  end

end
