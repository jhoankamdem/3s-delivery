require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get locations_update_url
    assert_response :success
  end
end
