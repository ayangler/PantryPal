require 'test_helper'

class YoursControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get yours_profile_url
    assert_response :success
  end

end
