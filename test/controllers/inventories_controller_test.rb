require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get setup" do
    get inventories_setup_url
    assert_response :success
  end

  test "should get inventory" do
    get inventories_inventory_url
    assert_response :success
  end

end
