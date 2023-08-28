require 'test_helper'

class GroceryListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get grocery_lists_new_url
    assert_response :success
  end

  test "should get edit" do
    get grocery_lists_edit_url
    assert_response :success
  end

end
