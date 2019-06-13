require 'test_helper'

class PlacePhotosControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get place_photos_create_url
    assert_response :success
  end

end
