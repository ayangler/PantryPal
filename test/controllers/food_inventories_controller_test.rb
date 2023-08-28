require 'test_helper'

class FoodInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @food_inventory = food_inventories(:one)
  end

  test "should get index" do
    get food_inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_food_inventory_url
    assert_response :success
  end

  test "should create food_inventory" do
    assert_difference('FoodInventory.count') do
      post food_inventories_url, params: { food_inventory: { name: @food_inventory.name } }
    end

    assert_redirected_to food_inventory_url(FoodInventory.last)
  end

  test "should show food_inventory" do
    get food_inventory_url(@food_inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_food_inventory_url(@food_inventory)
    assert_response :success
  end

  test "should update food_inventory" do
    patch food_inventory_url(@food_inventory), params: { food_inventory: { name: @food_inventory.name } }
    assert_redirected_to food_inventory_url(@food_inventory)
  end

  test "should destroy food_inventory" do
    assert_difference('FoodInventory.count', -1) do
      delete food_inventory_url(@food_inventory)
    end

    assert_redirected_to food_inventories_url
  end
end
